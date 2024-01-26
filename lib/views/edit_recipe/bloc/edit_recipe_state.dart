part of 'edit_recipe_bloc.dart';

enum EditRecipeStatus { initial, loading, success, failure }

class EditRecipeState extends Equatable {
  const EditRecipeState({
    this.recipe = const Recipe(),
    this.status = EditRecipeStatus.initial,
    this.index = -1,
    this.type = '',
    this.optionName = '',
    this.imagePath = '',
    this.ingredientList = const [],
  });
  final Recipe recipe;

  final EditRecipeStatus status;
  final int index;

  final String type;
  final String optionName;
  final String imagePath;
  final List<Ingredient> ingredientList;

  EditRecipeState copyWith({
    EditRecipeStatus Function()? status,
    int Function()? index,
    String Function()? type,
    String Function()? optionName,
    String Function()? imagePath,
    List<Ingredient> Function()? ingredientList,
  }) {
    return EditRecipeState(
      status: status != null ? status() : this.status,
      index: index != null ? index() : this.index,
      type: type != null ? type() : this.type,
      optionName: optionName != null ? optionName() : this.optionName,
      imagePath: imagePath != null ? imagePath() : this.imagePath,
      ingredientList:
          ingredientList != null ? ingredientList() : this.ingredientList,
    );
  }

  @override
  List<Object> get props => [status, optionName, imagePath, ingredientList];
}
