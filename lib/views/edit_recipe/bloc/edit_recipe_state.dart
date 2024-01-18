part of 'edit_recipe_bloc.dart';

class EditRecipeState extends Equatable {
  const EditRecipeState({
    this.optionSelect = const ['* ไม่ระบุ', '* เพิ่มตัวเลือกใหม่'],
    this.optionValue = '* ไม่ระบุ',
    this.optionName = '',
    this.imagePath = '',
    this.ingredientList = const [],
  });

  final List<String> optionSelect;
  final String optionValue;
  final String optionName;

  final String imagePath;

  final List<Ingredient> ingredientList;

  EditRecipeState copyWith({
    List<String> Function()? optionSelect,
    String Function()? optionValue,
    String Function()? optionName,
    String Function()? imagePath,
    List<Ingredient> Function()? ingredientList,
  }) {
    return EditRecipeState(
      optionSelect: optionSelect != null ? optionSelect() : this.optionSelect,
      optionValue: optionValue != null ? optionValue() : this.optionValue,
      optionName: optionName != null ? optionName() : this.optionName,
      imagePath: imagePath != null ? imagePath() : this.imagePath,
      ingredientList:
          ingredientList != null ? ingredientList() : this.ingredientList,
    );
  }

  @override
  List<Object> get props =>
      [optionSelect, optionValue, optionName, imagePath, ingredientList];
}
