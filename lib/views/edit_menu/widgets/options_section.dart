import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book/views/edit_menu/bloc/edit_menu_bloc.dart';
import 'package:recipes_book/views/edit_recipe/view/edit_recipe_view.dart';
import 'package:recipes_repository/recipes_repository.dart';

class OptionsSection extends StatelessWidget {
  const OptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<EditMenuBloc>().state;

    void navigatorPushEditRecipe(Recipe recipe, int index) {
      Navigator.of(context).push(
        EditRecipePage.route(
          editMenuBloc: context.read<EditMenuBloc>(),
          recipe: recipe,
          index: index,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Column(
            children: <Widget>[
              const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(18),
                  child: Text(
                    'สูตรประเภทร้อน',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              ...state.recipeHot.asMap().entries.map(
                    (e) => ListTile(
                      leading: const Icon(Icons.coffee),
                      title: Text(e.value.optionName),
                      trailing: IconButton(
                        onPressed: () {
                          context.read<EditMenuBloc>().add(
                                DeleteRecipe(
                                  index: e.key,
                                  type: e.value.type,
                                ),
                              );
                        },
                        icon: const Icon(Icons.delete_forever),
                      ),
                      onTap: () {
                        navigatorPushEditRecipe(e.value, e.key);
                      },
                    ),
                  ),
              FilledButton.tonalIcon(
                onPressed: () {
                  navigatorPushEditRecipe(Recipe(type: 'ร้อน'), -1);
                },
                icon: const Icon(Icons.add),
                label: const Text('เพิ่มสูตรประเภทร้อน'),
              ),
              const SizedBox(height: 16),
            ],
          ),
          Column(
            children: [
              const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(18),
                  child: Text(
                    'สูตรประเภทเย็น',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              ...state.recipeIce.asMap().entries.map(
                    (e) => ListTile(
                      leading: const Icon(Icons.ac_unit),
                      title: Text(e.value.optionName),
                      trailing: IconButton(
                        onPressed: () {
                          context.read<EditMenuBloc>().add(
                                DeleteRecipe(
                                  index: e.key,
                                  type: e.value.type,
                                ),
                              );
                        },
                        icon: const Icon(Icons.delete_forever),
                      ),
                      onTap: () {
                        navigatorPushEditRecipe(e.value, e.key);
                      },
                    ),
                  ),
              FilledButton.tonalIcon(
                onPressed: () {
                  navigatorPushEditRecipe(Recipe(type: 'เย็น'), -1);
                },
                icon: const Icon(Icons.add),
                label: const Text('เพิ่มสูตรประเภทเย็น'),
              ),
              const SizedBox(height: 16),
            ],
          ),
          Column(
            children: [
              const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(18),
                  child: Text(
                    'สูตรประเภทปั่น',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              ...state.recipeFrappe.asMap().entries.map(
                    (e) => ListTile(
                      leading: const Icon(Icons.cyclone),
                      title: Text(e.value.optionName),
                      trailing: IconButton(
                        onPressed: () {
                          context.read<EditMenuBloc>().add(
                                DeleteRecipe(
                                  index: e.key,
                                  type: e.value.type,
                                ),
                              );
                        },
                        icon: const Icon(Icons.delete_forever),
                      ),
                      onTap: () {
                        navigatorPushEditRecipe(e.value, e.key);
                      },
                    ),
                  ),
              FilledButton.tonalIcon(
                onPressed: () {
                  navigatorPushEditRecipe(Recipe(type: 'ปั่น'), -1);
                },
                icon: const Icon(Icons.add),
                label: const Text('เพิ่มสูตรประเภทปั่น'),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ],
      ),
    );
  }
}
