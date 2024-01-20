import 'dart:developer';

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
  })  : _recipesRepository = recipesRepository,
        _editMenuBloc = editMenuBloc,
        super(const EditRecipeState()) {
    on<InitialState>(_onInitialState);
    on<OptionNameOnChange>(_onOptionNameOnChange);
    on<IngredientAdd>(_onIngredientAdd);
    on<IngredientEdit>(_onIngredientEdit);
    on<IngredientDelete>(_onIngredientDelete);
    on<ShowDisplayPickImageDialog>(_onShowDisplayPickImageDialog);
    on<ImageDelete>(_onImageDelete);
    on<EditRecipeSubmitted>(_onEditRecipeSubmitted);
  }

  final RecipesRepository _recipesRepository;
  final EditMenuBloc _editMenuBloc;

  void _onInitialState(
    InitialState event,
    Emitter<EditRecipeState> emit,
  ) {
    log('_onInitialState');
  }

  void _onEditRecipeSubmitted(
    EditRecipeSubmitted event,
    Emitter<EditRecipeState> emit,
  ) {
    if (state.ingredientList.length > 0) {
      final recipe = Recipe(ingredients: state.ingredientList);
    }
    emit(
      state.copyWith(
        status: () => EditRecipeStatus.success,
      ),
    );
    _editMenuBloc.add(AddRecipe());
    event.callback();
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
