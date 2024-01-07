import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book/l10n/l10n.dart';
import 'package:recipes_book/views/explore/view/view.dart';
import 'package:recipes_repository/recipes_repository.dart';

class App extends StatelessWidget {
  const App({required this.recipesRepository, super.key});

  final RecipesRepository recipesRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: recipesRepository,
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const ExploreView(),
    );
  }
}
