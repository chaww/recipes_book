import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book/views/edit_recipe/bloc/edit_recipe_bloc.dart';
import 'package:recipes_book/views/edit_recipe/widgets/widgets.dart';
import 'package:recipes_repository/recipes_repository.dart';

class EditRecipePage extends StatelessWidget {
  const EditRecipePage({super.key});

  static Route<void> route({Recipe? recipe}) {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => EditRecipeBloc(
          recipesRepository: context.read<RecipesRepository>(),
          recipe: recipe,
        ),
        child: const EditRecipePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditRecipeBloc, EditRecipeState>(
      listenWhen: (previous, current) =>
          previous.status != current.status &&
          current.status == EditRecipeStatus.success,
      listener: (context, state) => Navigator.of(context).pop(),
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
              context.read<EditRecipeBloc>().add(const EditRecipeSubmitted());
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
