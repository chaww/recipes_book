part of 'edit_recipe_bloc.dart';

enum EditRecipeStatus { initial, loading, success, failure }

extension EditTodoStatusX on EditRecipeStatus {
  bool get isLoadingOrSuccess => [
        EditRecipeStatus.loading,
        EditRecipeStatus.success,
      ].contains(this);
}

class EditRecipeState extends Equatable {
  const EditRecipeState({
    this.status = EditRecipeStatus.initial,
    this.optionName = '',
    this.imagePath = '',
    this.ingredientList = const [],
  });

  final EditRecipeStatus status;

  final String optionName;

  final String imagePath;

  final List<Ingredient> ingredientList;

  EditRecipeState copyWith({
    String Function()? optionName,
    String Function()? imagePath,
    List<Ingredient> Function()? ingredientList,
  }) {
    return EditRecipeState(
      optionName: optionName != null ? optionName() : this.optionName,
      imagePath: imagePath != null ? imagePath() : this.imagePath,
      ingredientList:
          ingredientList != null ? ingredientList() : this.ingredientList,
    );
  }

  @override
  List<Object> get props => [optionName, imagePath, ingredientList];
}
