part of 'edit_menu_bloc.dart';

enum EditMenuStatus { initial, loading, success, failure }

class EditMenuState extends Equatable {
  const EditMenuState({
    this.status = EditMenuStatus.initial,
    this.categoryList = const ['ไม่ระบุ', 'ชา', 'กาแฟ'],
    this.imagePath = '',
    this.name = '',
    this.category = '',
    this.recipeHot = const [],
    this.recipeIce = const [],
    this.recipeFrappe = const [],
    this.validateName = true,
    this.validateRecipeList = true,
  });

  final EditMenuStatus status;
  final List<String> categoryList;

  final String imagePath;
  final String name;
  final String category;
  final List<Recipe> recipeHot;
  final List<Recipe> recipeIce;
  final List<Recipe> recipeFrappe;

  final bool validateName;
  final bool validateRecipeList;

  EditMenuState copyWith({
    EditMenuStatus Function()? status,
    List<String> Function()? categoryList,
    String Function()? imagePath,
    String Function()? name,
    String Function()? category,
    List<Recipe> Function()? recipeHot,
    List<Recipe> Function()? recipeIce,
    List<Recipe> Function()? recipeFrappe,
    bool Function()? validateName,
    bool Function()? validateRecipeList,
  }) {
    return EditMenuState(
      status: status != null ? status() : this.status,
      categoryList: categoryList != null ? categoryList() : this.categoryList,
      imagePath: imagePath != null ? imagePath() : this.imagePath,
      name: name != null ? name() : this.name,
      category: category != null ? category() : this.category,
      recipeHot: recipeHot != null ? recipeHot() : this.recipeHot,
      recipeIce: recipeIce != null ? recipeIce() : this.recipeIce,
      recipeFrappe: recipeFrappe != null ? recipeFrappe() : this.recipeFrappe,
      validateName: validateName != null ? validateName() : this.validateName,
      validateRecipeList: validateRecipeList != null
          ? validateRecipeList()
          : this.validateRecipeList,
    );
  }

  @override
  List<Object> get props => [
        status,
        categoryList,
        imagePath,
        name,
        category,
        recipeHot,
        recipeIce,
        recipeFrappe,
        validateName,
        validateRecipeList,
      ];
}
