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
        splashColor: Colors.orange.withAlpha(30),
        onTap: () {
          // context.read<RecipeStateProvider>().setRecipeOpen(recipe);
          Navigator.of(context).push(DetailsPage.route(menu: menu));
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(File(menu.image)),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 0.5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 100,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Text(
                        menu.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
