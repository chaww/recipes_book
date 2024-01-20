part of 'edit_recipe_bloc.dart';

enum EditRecipeStatus { initial, loading, success, failure }

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
    EditRecipeStatus Function()? status,
    String Function()? optionName,
    String Function()? imagePath,
    List<Ingredient> Function()? ingredientList,
  }) {
    return EditRecipeState(
      status: status != null ? status() : this.status,
      optionName: optionName != null ? optionName() : this.optionName,
      imagePath: imagePath != null ? imagePath() : this.imagePath,
      ingredientList:
          ingredientList != null ? ingredientList() : this.ingredientList,
    );
  }

  @override
  List<Object> get props => [status, optionName, imagePath, ingredientList];
}
