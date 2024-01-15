import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book/views/edit_recipe/bloc/edit_recipe_bloc.dart';
import 'package:recipes_book/views/edit_recipe/widgets/widgets.dart';
import 'package:recipes_repository/recipes_repository.dart';

class EditRecipePage extends StatelessWidget {
  const EditRecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditRecipeBloc(
        recipesRepository: context.read<RecipesRepository>(),
      ),
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
        title: Text('อเมริกาโน (เย็น)'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.done_all),
          ),
        ],
      ),
      body: ListView(
        // shrinkWrap: true,
        children: const <Widget>[
          OptionSection(),
          Divider(),
          ImageSection(),
          IngreditntsSection(),
        ],
      ),
    );
  }
}
