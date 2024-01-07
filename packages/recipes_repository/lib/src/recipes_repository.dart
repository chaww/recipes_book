import 'package:recipes_api/recipes_api.dart';

class RecipesRepository {
  // ignore: public_member_api_docs
  const RecipesRepository({
    required RecipesApi recipesApi,
  }) : _recipesApi = recipesApi;

  final RecipesApi _recipesApi;

  Stream<List<Menu>> getBook() => _recipesApi.getBook();

  Future<Menu> getMenu(String id) => _recipesApi.getMenu(id);

  Future<void> saveMenu(Menu menu) => _recipesApi.saveMenu(menu);

  Future<void> deleteMenu(String id) => _recipesApi.deleteMenu(id);
}
