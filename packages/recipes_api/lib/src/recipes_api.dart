import 'package:recipes_api/recipes_api.dart';

abstract class RecipesApi {
  const RecipesApi();

  /// Provides a [Stream] of all menu list.
  Stream<List<Menu>> getBook();

  Future<Menu> getMenu(String id);

  Future<void> saveMenu(Menu menu);

  Future<void> deleteMenu(String id);
}

class MenuNotFoundException implements Exception {}

class RecipeNotFoundException implements Exception {}
