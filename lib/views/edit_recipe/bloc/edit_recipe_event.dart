part of 'edit_recipe_bloc.dart';

sealed class EditRecipeEvent extends Equatable {
  const EditRecipeEvent();

  @override
  List<Object> get props => [];
}

class OptionSelectOnChanged extends EditRecipeEvent {
  const OptionSelectOnChanged(this.optionValue);

  final String optionValue;

  @override
  List<Object> get props => [optionValue];
}

class OptionNameOnChange extends EditRecipeEvent {
  const OptionNameOnChange(this.optionName);

  final String optionName;

  @override
  List<Object> get props => [optionName];
}

class ImagePathChange extends EditRecipeEvent {
  const ImagePathChange(this.path);

  final String path;

  @override
  List<Object> get props => [path];
}

class IngredientEdit extends EditRecipeEvent {
  const IngredientEdit({required this.item, required this.index});

  final Ingredient item;
  final int index;

  @override
  List<Object> get props => [item, index];
}

class IngredientAdd extends EditRecipeEvent {
  const IngredientAdd(this.item);

  final Ingredient item;

  @override
  List<Object> get props => [item];
}

class IngredientDelete extends EditRecipeEvent {
  const IngredientDelete(this.index);

  final int index;

  @override
  List<Object> get props => [index];
}
