import 'package:recipes_repository/recipes_repository.dart';
import 'package:recipes_book/mock/recipes.dart';

Future<void> mock_data({required RecipesRepository recipesRepository}) async {
  await mock_recipes(recipesRepository: recipesRepository);
}
