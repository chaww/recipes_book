import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipes_book/views/edit_menu/bloc/edit_menu_bloc.dart';
import 'package:recipes_repository/recipes_repository.dart';

part 'edit_recipe_event.dart';
part 'edit_recipe_state.dart';

class EditRecipeBloc extends Bloc<EditRecipeEvent, EditRecipeState> {
  EditRecipeBloc({
    required RecipesRepository recipesRepository,
    required EditMenuBloc editMenuBloc,
    required Recipe recipe,
    required int index,
  })  : _recipesRepository = recipesRepository,
        _editMenuBloc = editMenuBloc,
        super(
          EditRecipeState(
            status: EditRecipeStatus.initial,
            index: index,
            optionName: recipe.optionName == '' ? 'ปกติ' : recipe.optionName,
            type: recipe.type,
            imagePath: recipe.image,
            ingredientList: recipe.ingredients,
          ),
        ) {
    on<OptionNameOnChange>(_onOptionNameOnChange);
    on<IngredientAdd>(_onIngredientAdd);
    on<IngredientEdit>(_onIngredientEdit);
    on<IngredientDelete>(_onIngredientDelete);
    on<ShowDisplayPickImageDialog>(_onShowDisplayPickImageDialog);
    on<ImageDelete>(_onImageDelete);
    on<EditRecipeSubmitted>(_onEditRecipeSubmitted);
    on<UpdateEditRecipeStatus>(_onUpdateEditRecipeStatus);
  }

  final RecipesRepository _recipesRepository;
  final EditMenuBloc _editMenuBloc;

  void _onEditRecipeSubmitted(
    EditRecipeSubmitted event,
    Emitter<EditRecipeState> emit,
  ) {
    if (state.ingredientList.isNotEmpty) {
      final recipe = Recipe(
        image: state.imagePath,
        type: state.type,
        optionName: state.optionName,
        ingredients: state.ingredientList,
      );
      _editMenuBloc.add(UpdateRecipe(recipe: recipe, index: state.index));
      emit(state.copyWith(status: () => EditRecipeStatus.success));
    } else {
      emit(state.copyWith(status: () => EditRecipeStatus.failure));
    }
  }

  void _onUpdateEditRecipeStatus(
    UpdateEditRecipeStatus event,
    Emitter<EditRecipeState> emit,
  ) {
    emit(state.copyWith(status: () => event.status));
  }

  void _onOptionNameOnChange(
    OptionNameOnChange event,
    Emitter<EditRecipeState> emit,
  ) {
    emit(state.copyWith(optionName: () => event.optionName));
  }

  Future<void> _onShowDisplayPickImageDialog(
    ShowDisplayPickImageDialog event,
    Emitter<EditRecipeState> emit,
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
    Emitter<EditRecipeState> emit,
  ) {
    emit(state.copyWith(imagePath: () => ''));
  }

  void _onIngredientAdd(
    IngredientAdd event,
    Emitter<EditRecipeState> emit,
  ) {
    emit(
      state.copyWith(
        ingredientList: () => [...state.ingredientList, event.item],
      ),
    );
  }

  void _onIngredientEdit(
    IngredientEdit event,
    Emitter<EditRecipeState> emit,
  ) {
    final list = [...state.ingredientList];
    list[event.index] = event.item;
    emit(state.copyWith(ingredientList: () => list));
  }

  void _onIngredientDelete(
    IngredientDelete event,
    Emitter<EditRecipeState> emit,
  ) {
    final list = [...state.ingredientList]..removeAt(event.index);
    emit(state.copyWith(ingredientList: () => list));
  }
}
