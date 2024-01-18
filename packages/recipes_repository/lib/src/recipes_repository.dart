import 'package:recipes_api/recipes_api.dart';
import 'package:recipes_repository/src/mock/mock.dart';
import 'package:recipes_repository/src/recipes_images.dart';

class RecipesRepository {
  // ignore: public_member_api_docs
  const RecipesRepository({
    required RecipesApi recipesApi,
  }) : _recipesApi = recipesApi;

  final RecipesApi _recipesApi;
  final RecipesImages _recipesImages = const RecipesImages();

  Stream<List<Menu>> getBook() => _recipesApi.getBook();

  Future<Menu> getMenu(String id) => _recipesApi.getMenu(id);

  Future<void> saveMenu(Menu menu) => _recipesApi.saveMenu(menu);

  Future<void> deleteMenu(String id) => _recipesApi.deleteMenu(id);

  Future<List<String>?> displayPickImageDialog({
    double? maxWidth,
    double? maxHeight,
  }) =>
      _recipesImages.displayPickImageDialog(
        maxWidth: maxWidth,
        maxHeight: maxHeight,
      );

  Future<void> mockData() => mock_data(recipesApi: _recipesApi);
}
