import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:recipes_api/recipes_api.dart';
import 'package:recipes_book/views/details/view/details_page.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({super.key, required this.menu});

  final Menu menu;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      // color: Colors.transparent,
      elevation: 0,
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          // context.read<RecipeStateProvider>().setRecipeOpen(recipe);
          Navigator.of(context).push(DetailsPage.route(menu: menu));
        },
        child: Column(
          children: [
            Container(
              height: 170,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(File(menu.image)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Text(
                  menu.name + ' aaaaaa',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
