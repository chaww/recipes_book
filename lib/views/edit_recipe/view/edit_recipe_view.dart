import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book/views/edit_menu/bloc/edit_menu_bloc.dart';
import 'package:recipes_book/views/edit_recipe/bloc/edit_recipe_bloc.dart';
import 'package:recipes_book/views/edit_recipe/widgets/widgets.dart';
import 'package:recipes_repository/recipes_repository.dart';

class EditRecipePage extends StatelessWidget {
  const EditRecipePage({super.key});

  static Route<void> route({
    required EditMenuBloc editMenuBloc,
    required Recipe recipe,
    required int index,
  }) {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => EditRecipeBloc(
          recipesRepository: context.read<RecipesRepository>(),
          editMenuBloc: editMenuBloc,
          recipe: recipe,
          index: index,
        ),
        child: const EditRecipePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditRecipeBloc, EditRecipeState>(
      listener: (context, state) {
        if (state.status == EditRecipeStatus.success) {
          Navigator.pop(context);
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
    final state = context.read<EditRecipeBloc>().state;
    var title = 'เพิ่มสูตร (${state.type})';
    if (state.ingredientList.isNotEmpty) {
      title = 'แก้ไขสูตร (${state.type})';
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
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
