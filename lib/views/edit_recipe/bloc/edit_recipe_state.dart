part of 'edit_recipe_bloc.dart';

class EditRecipeState extends Equatable {
  const EditRecipeState({
    this.optionSelect = const ['* ไม่ระบุ', '* เพิ่มตัวเลือกใหม่'],
    this.optionValue = '* ไม่ระบุ',
    this.optionName = '',
  });

  final List<String> optionSelect;
  final String optionValue;
  final String optionName;

  EditRecipeState copyWith({
    List<String> Function()? optionSelect,
    String Function()? optionValue,
    String Function()? optionName,
  }) {
    return EditRecipeState(
      optionSelect: optionSelect != null ? optionSelect() : this.optionSelect,
      optionValue: optionValue != null ? optionValue() : this.optionValue,
      optionName: optionName != null ? optionName() : this.optionName,
    );
  }

  @override
  List<Object> get props => [optionSelect, optionValue, optionName];
}

final class EditRecipeInitial extends EditRecipeState {}
