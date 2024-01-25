import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipes_repository/recipes_repository.dart';

part 'edit_menu_event.dart';
part 'edit_menu_state.dart';

class EditMenuBloc extends Bloc<EditMenuEvent, EditMenuState> {
  EditMenuBloc({
    required RecipesRepository recipesRepository,
  })  : _recipesRepository = recipesRepository,
        super(const EditMenuState()) {
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
    final recipeList = [
      ...state.recipeHot,
      ...state.recipeIce,
      ...state.recipeFrappe,
    ];
    if (state.name.isEmpty) {
      emit(
        state.copyWith(
          validateName: () => false,
        ),
      );
    }
    if (recipeList.isEmpty) {
      emit(
        state.copyWith(
          validateRecipeList: () => false,
        ),
      );
    }
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
    } else {
      emit(
        state.copyWith(
          status: () => EditMenuStatus.failure,
        ),
      );
    }
  }

  void _onUpdateEditMenuStatus(
    UpdateEditMenuStatus event,
    Emitter<EditMenuState> emit,
  ) {
    emit(
      state.copyWith(
        status: () => event.status,
      ),
    );
  }

  void _onDeleteRecipe(
    DeleteRecipe event,
    Emitter<EditMenuState> emit,
  ) {
    final type = event.type;
    if (type == 'ร้อน') {
      final newList = [...state.recipeHot];
      // ignore: cascade_invocations
      newList.removeAt(event.index);
      emit(
        state.copyWith(
          recipeHot: () => newList,
        ),
      );
    } else if (type == 'เย็น') {
      final newList = [...state.recipeIce];
      // ignore: cascade_invocations
      newList.removeAt(event.index);
      emit(
        state.copyWith(
          recipeIce: () => newList,
        ),
      );
    } else if (type == 'ปั่น') {
      final newList = [...state.recipeFrappe];
      // ignore: cascade_invocations
      newList.removeAt(event.index);
      emit(
        state.copyWith(
          recipeFrappe: () => newList,
        ),
      );
    }
  }

  void _onUpdateRecipe(
    UpdateRecipe event,
    Emitter<EditMenuState> emit,
  ) {
    final type = event.recipe.type;
    if (type == 'ร้อน') {
      if (event.index == -1) {
        emit(
          state.copyWith(
            recipeHot: () => [...state.recipeHot, event.recipe],
          ),
        );
      } else {
        final newList = [...state.recipeHot];
        newList[event.index] = event.recipe;
        emit(
          state.copyWith(
            recipeHot: () => newList,
          ),
        );
      }
    } else if (type == 'เย็น') {
      if (event.index == -1) {
        emit(
          state.copyWith(
            recipeIce: () => [...state.recipeIce, event.recipe],
          ),
        );
      } else {
        final newList = [...state.recipeIce];
        newList[event.index] = event.recipe;
        emit(
          state.copyWith(
            recipeIce: () => newList,
          ),
        );
      }
    } else if (type == 'ปั่น') {
      if (event.index == -1) {
        emit(
          state.copyWith(
            recipeFrappe: () => [...state.recipeFrappe, event.recipe],
          ),
        );
      } else {
        final newList = [...state.recipeFrappe];
        newList[event.index] = event.recipe;
        emit(
          state.copyWith(
            recipeFrappe: () => newList,
          ),
        );
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
    emit(
      state.copyWith(
        imagePath: () => '',
      ),
    );
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
    emit(
      state.copyWith(
        category: () => event.category,
      ),
    );
  }
}
