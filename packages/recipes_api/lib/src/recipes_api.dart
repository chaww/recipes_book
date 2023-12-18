import 'package:recipes_api/recipes_api.dart';

abstract class RecipesApi {
  const RecipesApi();

  Stream<List<Recipe>> getRecips();
}
