import 'package:flutter/widgets.dart';
import 'package:recipes_book/app/app.dart';
import 'package:recipes_book/bootstrap.dart';
import 'package:local_storage_recipes_api/local_storage_recipes_api.dart';
import 'package:recipes_repository/recipes_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final recipesApi = LocalStorageRecipesApi(
    plugin: await SharedPreferences.getInstance(),
  );

  final recipesRepository = RecipesRepository(recipesApi: recipesApi);

  bootstrap(
    () => App(recipesRepository: recipesRepository),
  );
}
