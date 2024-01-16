part of 'edit_recipe_bloc.dart';

class EditRecipeState extends Equatable {
  const EditRecipeState({
    this.optionSelect = const ['* ไม่ระบุ', '* เพิ่มตัวเลือกใหม่'],
    this.optionValue = '* ไม่ระบุ',
    this.optionName = '',
    this.ingredientList = const [],
  });

  final List<String> optionSelect;
  final String optionValue;
  final String optionName;

  final List<Ingredient> ingredientList;

  EditRecipeState copyWith({
    List<String> Function()? optionSelect,
    String Function()? optionValue,
    String Function()? optionName,
    List<Ingredient> Function()? ingredientList,
  }) {
    return EditRecipeState(
      optionSelect: optionSelect != null ? optionSelect() : this.optionSelect,
      optionValue: optionValue != null ? optionValue() : this.optionValue,
      optionName: optionName != null ? optionName() : this.optionName,
      ingredientList:
          ingredientList != null ? ingredientList() : this.ingredientList,
    );
  }

  @override
  List<Object> get props =>
      [optionSelect, optionValue, optionName, ingredientList];
}
