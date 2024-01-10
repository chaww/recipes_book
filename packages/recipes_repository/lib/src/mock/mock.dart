import 'package:recipes_api/recipes_api.dart';
import 'package:recipes_repository/recipes_repository.dart';
import 'package:recipes_repository/src/mock/recipes.dart';

Future<void> mock_data({required RecipesApi recipesApi}) async {
  await mock_recipes(recipesApi: recipesApi);
}
