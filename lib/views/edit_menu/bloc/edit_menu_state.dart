part of 'edit_menu_bloc.dart';

enum EditMenuStatus { initial, loading, success, failure }

class EditMenuState extends Equatable {
  const EditMenuState({
    required this.menu,
    this.status = EditMenuStatus.initial,
    this.categoryList = const ['ไม่ระบุ', 'ชา', 'กาแฟ'],
    this.imagePath = '',
    this.name = '',
    this.category = '',
    this.recipeHotList = const [],
    this.recipeIceList = const [],
    this.recipeFrappeList = const [],
    this.validateName = true,
    this.validateRecipeList = true,
  });

  final Menu menu;

  final EditMenuStatus status;
  final List<String> categoryList;

  final String imagePath;
  final String name;
  final String category;
  final List<Recipe> recipeHotList;
  final List<Recipe> recipeIceList;
  final List<Recipe> recipeFrappeList;

  final bool validateName;
  final bool validateRecipeList;

  EditMenuState copyWith({
    Menu Function()? menu,
    EditMenuStatus Function()? status,
    List<String> Function()? categoryList,
    String Function()? imagePath,
    String Function()? name,
    String Function()? category,
    List<Recipe> Function()? recipeHotList,
    List<Recipe> Function()? recipeIceList,
    List<Recipe> Function()? recipeFrappeList,
    bool Function()? validateName,
    bool Function()? validateRecipeList,
  }) {
    return EditMenuState(
      menu: menu != null ? menu() : this.menu,
      status: status != null ? status() : this.status,
      categoryList: categoryList != null ? categoryList() : this.categoryList,
      imagePath: imagePath != null ? imagePath() : this.imagePath,
      name: name != null ? name() : this.name,
      category: category != null ? category() : this.category,
      recipeHotList:
          recipeHotList != null ? recipeHotList() : this.recipeHotList,
      recipeIceList:
          recipeIceList != null ? recipeIceList() : this.recipeIceList,
      recipeFrappeList:
          recipeFrappeList != null ? recipeFrappeList() : this.recipeFrappeList,
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
        recipeHotList,
        recipeIceList,
        recipeFrappeList,
        validateName,
        validateRecipeList,
      ];
}
