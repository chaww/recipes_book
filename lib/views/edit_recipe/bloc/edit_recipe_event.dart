part of 'edit_recipe_bloc.dart';

sealed class EditRecipeEvent extends Equatable {
  const EditRecipeEvent();

  @override
  List<Object> get props => [];
}

class OptionSelectOnChanged extends EditRecipeEvent {
  const OptionSelectOnChanged({required this.optionValue});

  final String optionValue;

  @override
  List<Object> get props => [optionValue];
}
