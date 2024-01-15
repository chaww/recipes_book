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
