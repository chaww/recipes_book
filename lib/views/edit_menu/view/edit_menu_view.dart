import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book/views/edit_menu/bloc/edit_menu_bloc.dart';
import 'package:recipes_book/views/edit_menu/widgets/widgets.dart';
import 'package:recipes_book/views/edit_recipe/bloc/edit_recipe_bloc.dart';
import 'package:recipes_repository/recipes_repository.dart';

class EditMenuPage extends StatelessWidget {
  const EditMenuPage({super.key});

  // static Route<void> route() {
  //   return MaterialPageRoute(
  //     builder: (context) => BlocProvider(
  //       create: (context) => EditMenuBloc(),
  //       child: const EditMenuPage(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EditMenuBloc(
            recipesRepository: context.read<RecipesRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => EditRecipeBloc(
            recipesRepository: context.read<RecipesRepository>(),
            editMenuBloc: context.read<EditMenuBloc>(),
          ),
        ),
      ],
      child: const EditMenuView(),
    );
  }
}

class EditMenuView extends StatelessWidget {
  const EditMenuView({super.key});

  final title = 'เพิ่มเมนูใหม่';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: ListView(
        shrinkWrap: true,
        children: const <Widget>[
          MenuSection(),
          OptionsSection(),
        ],
      ),
    );
  }
}
