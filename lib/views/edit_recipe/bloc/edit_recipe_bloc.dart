import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipes_api/recipes_api.dart';
import 'package:recipes_repository/recipes_repository.dart';

part 'edit_recipe_event.dart';
part 'edit_recipe_state.dart';

class EditRecipeBloc extends Bloc<EditRecipeEvent, EditRecipeState> {
  EditRecipeBloc({
    required RecipesRepository recipesRepository,
  })  : _recipesRepository = recipesRepository,
        super(EditRecipeState()) {
    on<OptionSelectOnChanged>(_optionSelectOnChanged);
    on<OptionNameOnChange>(_optionNameOnChange);
    on<IngredientAdd>(_ingredientAdd);
    on<IngredientEdit>(_ingredientEdit);
    on<IngredientDelete>(_ingredientDelete);
  }

  final RecipesRepository _recipesRepository;

  void _optionSelectOnChanged(
    OptionSelectOnChanged event,
    Emitter<EditRecipeState> emit,
  ) {
    emit(state.copyWith(optionValue: () => event.optionValue));
  }

  void _optionNameOnChange(
    OptionNameOnChange event,
    Emitter<EditRecipeState> emit,
  ) {
    emit(state.copyWith(optionName: () => event.optionName));
  }

  void _ingredientAdd(
    IngredientAdd event,
    Emitter<EditRecipeState> emit,
  ) {
    emit(
      state.copyWith(
        ingredientList: () => [...state.ingredientList, event.item],
      ),
    );
  }

  void _ingredientEdit(
    IngredientEdit event,
    Emitter<EditRecipeState> emit,
  ) {
    final list = [...state.ingredientList];
    list[event.index] = event.item;
    emit(
      state.copyWith(
        ingredientList: () => list,
      ),
    );
  }

  void _ingredientDelete(
    IngredientDelete event,
    Emitter<EditRecipeState> emit,
  ) {
    final list = [...state.ingredientList]..removeAt(event.index);
    emit(state.copyWith(ingredientList: () => list));
  }
}
