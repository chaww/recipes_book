import 'package:flutter/material.dart';
import 'package:recipes_api/recipes_api.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({super.key, required this.menu});

  final Menu menu;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        clipBehavior: Clip.hardEdge,
        color: Colors.transparent,
        elevation: 0,
        child: InkWell(
          splashColor: Colors.orange.withAlpha(30),
          // onTap: () {
          //   context.read<RecipeStateProvider>().setRecipeOpen(recipe);
          //   Navigator.of(context).push(
          //     MaterialPageRoute<void>(
          //       builder: (BuildContext context) => RecipeView(
          //         recipe: recipe,
          //       ),
          //     ),
          //   );
          // },
          child: Stack(
            children: [
              // Hero(
              //   tag: 'assets/images/${menu.image}',
              //   child: Image(
              //     image: AssetImage('assets/images/${menu.image}'),
              //   ),
              // ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: 100,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(
                        child: Text(
                          menu.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
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
      ),
    );
  }
}
