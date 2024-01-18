import 'dart:developer';

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
    on<OptionSelectOnChanged>(_onOptionSelectOnChanged);
    on<OptionNameOnChange>(_onOptionNameOnChange);
    on<IngredientAdd>(_onIngredientAdd);
    on<IngredientEdit>(_onIngredientEdit);
    on<IngredientDelete>(_onIngredientDelete);
    on<ImagePathChange>(_onImagePathChange);
  }

  final RecipesRepository _recipesRepository;

  void _onOptionSelectOnChanged(
    OptionSelectOnChanged event,
    Emitter<EditRecipeState> emit,
  ) {
    emit(state.copyWith(optionValue: () => event.optionValue));
  }

  void _onOptionNameOnChange(
    OptionNameOnChange event,
    Emitter<EditRecipeState> emit,
  ) {
    emit(state.copyWith(optionName: () => event.optionName));
  }

  void _onImagePathChange(
    ImagePathChange event,
    Emitter<EditRecipeState> emit,
  ) {
    log(event.path);
    emit(state.copyWith(imagePath: () => event.path));
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
    emit(
      state.copyWith(
        ingredientList: () => list,
      ),
    );
  }

  void _onIngredientDelete(
    IngredientDelete event,
    Emitter<EditRecipeState> emit,
  ) {
    final list = [...state.ingredientList]..removeAt(event.index);
    emit(state.copyWith(ingredientList: () => list));
  }
}
