import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book/views/edit_menu/bloc/edit_menu_bloc.dart';
import 'package:recipes_book/views/edit_recipe/bloc/edit_recipe_bloc.dart';
import 'package:recipes_book/views/edit_recipe/view/edit_recipe_view.dart';

class OptionsSection extends StatelessWidget {
  const OptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<EditMenuBloc>().state;
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Column(
            children: <Widget>[
              Container(
                // decoration: BoxDecoration(color: Colors.amber),
                width: double.infinity,
                child: const Padding(
                  padding: EdgeInsets.all(18),
                  child: Text(
                    'สูตรประเภทร้อน',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              ...state.recipeHot.map(
                (recipe) => ListTile(
                  leading: Icon(Icons.coffee),
                  title: Text(recipe.optionName),
                  trailing: Icon(Icons.navigate_next),
                  onTap: () {},
                ),
              ),
              FilledButton.tonalIcon(
                onPressed: () {
                  Navigator.of(context).push(
                    EditRecipePage.route(
                      editMenuBloc: context.read<EditMenuBloc>(),
                    ),
                  );
                },
                icon: const Icon(Icons.add),
                label: Text('เพิ่มสูตรประเภทร้อน'),
              ),
              const SizedBox(height: 16),
            ],
          ),
          Column(
            children: [
              Container(
                // decoration: BoxDecoration(color: Colors.amber),
                width: double.infinity,
                child: const Padding(
                  padding: EdgeInsets.all(18),
                  child: Text(
                    'สูตรประเภทเย็น',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              ...state.recipeIce.map(
                (recipe) => ListTile(
                  leading: Icon(Icons.ac_unit),
                  title: Text(recipe.optionName),
                  trailing: Icon(Icons.navigate_next),
                  onTap: () {},
                ),
              ),
              FilledButton.tonalIcon(
                onPressed: () {
                  Navigator.of(context).push(
                    EditRecipePage.route(
                      editMenuBloc: context.read<EditMenuBloc>(),
                    ),
                  );
                },
                icon: const Icon(Icons.add),
                label: Text('เพิ่มสูตรประเภทเย็น'),
              ),
              const SizedBox(height: 16),
            ],
          ),
          Column(
            children: [
              Container(
                // decoration: BoxDecoration(color: Colors.amber),
                width: double.infinity,
                child: const Padding(
                  padding: EdgeInsets.all(18),
                  child: Text(
                    'สูตรประเภทปั่น',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              ...state.recipeFrappe.map(
                (recipe) => ListTile(
                  leading: Icon(Icons.cyclone),
                  title: Text(recipe.optionName),
                  trailing: Icon(Icons.navigate_next),
                  onTap: () {},
                ),
              ),
              FilledButton.tonalIcon(
                onPressed: () {
                  Navigator.of(context).push(
                    EditRecipePage.route(
                      editMenuBloc: context.read<EditMenuBloc>(),
                    ),
                  );
                },
                icon: const Icon(Icons.add),
                label: Text('เพิ่มสูตรประเภทปั่น'),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ],
      ),
    );
  }
}
