import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book/views/edit_menu/bloc/edit_menu_bloc.dart';
import 'package:recipes_book/views/edit_recipe/bloc/edit_recipe_bloc.dart';
import 'package:recipes_book/views/edit_recipe/widgets/widgets.dart';
import 'package:recipes_repository/recipes_repository.dart';

class EditRecipePage extends StatelessWidget {
  const EditRecipePage({super.key});

  static Route<void> route({Recipe? recipe}) {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (_) => EditRecipeBloc(
          recipesRepository: context.read<RecipesRepository>(),
        ),
        child: const EditRecipePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (_) => EditRecipeBloc(
    //     recipesRepository: context.read<RecipesRepository>(),
    //     editMenuBloc: context.read<EditMenuBloc>(),
    //   ),
    //   child: BlocListener<EditRecipeBloc, EditRecipeState>(
    //     listener: (context, state) {
    //       log(state.status.toString());
    //       if (state.status == EditRecipeStatus.success) {
    //         final recipe = Recipe(ingredients: state.ingredientList);
    //         BlocProvider.of<EditMenuBloc>(context).add(AddRecipe(recipe));
    //       }
    //     },
    //     child: const EditRecipeView(),
    //   ),
    // );

    return BlocListener<EditRecipeBloc, EditRecipeState>(
      listener: (context, state) {
        log(state.status.toString());
        if (state.status == EditRecipeStatus.success) {
          final recipe = Recipe(ingredients: state.ingredientList);
          BlocProvider.of<EditMenuBloc>(context).add(AddRecipe(recipe));
        }
      },
      child: const EditRecipeView(),
    );
  }
}

class EditRecipeView extends StatelessWidget {
  const EditRecipeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('เพิ่มสูตร'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<EditRecipeBloc>().add(
                EditRecipeSubmitted(() {
                  Navigator.pop(context);
                }),
              );
            },
            icon: const Icon(Icons.done_all),
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: const <Widget>[
          OptionSection(),
          ImageSection(),
          IngreditntsSection(),
        ],
      ),
    );
  }
}
