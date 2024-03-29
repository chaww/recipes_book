import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipes_repository/recipes_repository.dart';

part 'edit_menu_event.dart';
part 'edit_menu_state.dart';

class EditMenuBloc extends Bloc<EditMenuEvent, EditMenuState> {
  EditMenuBloc({
    required RecipesRepository recipesRepository,
    required Menu menu,
  })  : _recipesRepository = recipesRepository,
        super(
          EditMenuState(
            menu: menu,
            imagePath: menu.image,
            name: menu.name,
            category: menu.category,
            recipeHotList:
                menu.recipeList.where((e) => e.type == 'ร้อน').toList(),
            recipeIceList:
                menu.recipeList.where((e) => e.type == 'เย็น').toList(),
            recipeFrappeList:
                menu.recipeList.where((e) => e.type == 'ปั่น').toList(),
          ),
        ) {
    on<UpdateRecipe>(_onUpdateRecipe);
    on<DeleteRecipe>(_onDeleteRecipe);
    on<ShowDisplayPickImageDialog>(_onShowDisplayPickImageDialog);
    on<ImageDelete>(_onImageDelete);
    on<NameChange>(_onNameChange);
    on<CategoryChange>(_onCategoryChange);
    on<EditMenuSubmitted>(_onEditMenuSubmitted);
    on<UpdateEditMenuStatus>(_onUpdateEditMenuStatus);
  }

  final RecipesRepository _recipesRepository;

  Future<void> _onEditMenuSubmitted(
    EditMenuSubmitted event,
    Emitter<EditMenuState> emit,
  ) async {
    emit(state.copyWith(status: () => EditMenuStatus.loading));
    final recipeList = [
      ...state.recipeHotList,
      ...state.recipeIceList,
      ...state.recipeFrappeList,
    ];
    emit(state.copyWith(validateName: () => state.name.isNotEmpty));
    emit(state.copyWith(validateRecipeList: () => recipeList.isNotEmpty));
    if (state.validateName && state.validateRecipeList) {
      final newRecipeList = <Recipe>[];
      var menuImagePath = state.imagePath;
      if (state.imagePath.isNotEmpty) {
        menuImagePath = await _recipesRepository.handleImagePath(
          source: state.imagePath,
        );
      }
      for (var index = 0; index < recipeList.length; index++) {
        final recipe = recipeList[index];
        final image = await _recipesRepository.handleImagePath(
          source: recipe.image,
        );
        newRecipeList.add(
          Recipe(
            image: image,
            type: recipe.type,
            ingredients: recipe.ingredients,
            optionName: recipe.optionName,
          ),
        );
      }
      final newMenu = Menu(
        name: state.name,
        image: menuImagePath,
        category: state.category,
        recipeList: newRecipeList,
      );
      await _recipesRepository.saveMenu(newMenu);
      emit(state.copyWith(status: () => EditMenuStatus.success));
    } else {
      emit(state.copyWith(status: () => EditMenuStatus.failure));
    }
  }

  void _onUpdateEditMenuStatus(
    UpdateEditMenuStatus event,
    Emitter<EditMenuState> emit,
  ) {
    emit(state.copyWith(status: () => event.status));
  }

  void _onDeleteRecipe(
    DeleteRecipe event,
    Emitter<EditMenuState> emit,
  ) {
    final type = event.type;
    if (type == 'ร้อน') {
      final newList = [...state.recipeHotList];
      // ignore: cascade_invocations
      newList.removeAt(event.index);
      emit(state.copyWith(recipeHotList: () => newList));
    } else if (type == 'เย็น') {
      final newList = [...state.recipeIceList];
      // ignore: cascade_invocations
      newList.removeAt(event.index);
      emit(state.copyWith(recipeIceList: () => newList));
    } else if (type == 'ปั่น') {
      final newList = [...state.recipeFrappeList];
      // ignore: cascade_invocations
      newList.removeAt(event.index);
      emit(state.copyWith(recipeFrappeList: () => newList));
    }
  }

  void _onUpdateRecipe(
    UpdateRecipe event,
    Emitter<EditMenuState> emit,
  ) {
    final type = event.recipe.type;
    if (type == 'ร้อน') {
      if (event.index == -1) {
        emit(state.copyWith(
            recipeHotList: () => [...state.recipeHotList, event.recipe]));
      } else {
        final newList = [...state.recipeHotList];
        newList[event.index] = event.recipe;
        emit(state.copyWith(recipeHotList: () => newList));
      }
    } else if (type == 'เย็น') {
      if (event.index == -1) {
        emit(state.copyWith(
            recipeIceList: () => [...state.recipeIceList, event.recipe]));
      } else {
        final newList = [...state.recipeIceList];
        newList[event.index] = event.recipe;
        emit(state.copyWith(recipeIceList: () => newList));
      }
    } else if (type == 'ปั่น') {
      if (event.index == -1) {
        emit(state.copyWith(
            recipeFrappeList: () => [...state.recipeFrappeList, event.recipe]));
      } else {
        final newList = [...state.recipeFrappeList];
        newList[event.index] = event.recipe;
        emit(state.copyWith(recipeFrappeList: () => newList));
      }
    }
  }

  Future<void> _onShowDisplayPickImageDialog(
    ShowDisplayPickImageDialog event,
    Emitter<EditMenuState> emit,
  ) async {
    final imagePath = await _recipesRepository.displayPickImageDialog(
      maxHeight: 1600,
      maxWidth: 1600,
    );
    emit(
      state.copyWith(imagePath: () => imagePath != null ? imagePath[0] : ''),
    );
  }

  void _onImageDelete(
    ImageDelete event,
    Emitter<EditMenuState> emit,
  ) {
    emit(state.copyWith(imagePath: () => ''));
  }

  void _onNameChange(
    NameChange event,
    Emitter<EditMenuState> emit,
  ) {
    emit(
      state.copyWith(
        name: () => event.name,
        validateName: () => event.name.isNotEmpty,
      ),
    );
  }

  void _onCategoryChange(
    CategoryChange event,
    Emitter<EditMenuState> emit,
  ) {
    emit(state.copyWith(category: () => event.category));
  }
}
