import 'package:recipes_api/recipes_api.dart';

abstract class RecipesApi {
  const RecipesApi();

  /// Provides a [Stream] of all menu list.
  Stream<List<Menu>> getMenuList();

  Stream<Menu> getMenu();

  Stream<void> saveMenu(Menu menu);

  Stream<void> deleteMenu(String id);

  //

  Stream<Recipe> getRecipe()

}

class RecipeNotFoundException implements Exception {}
