import 'package:flutter/material.dart';
import 'package:recipes_repository/recipes_repository.dart';

class IngredientsSection extends StatelessWidget {
  const IngredientsSection({
    required this.recipe,
    super.key,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Row(
          children: [
            SizedBox(width: 24, height: 48),
            Text('วัตถุดิบ'),
            Spacer(),
          ],
        ),
        ...recipe.ingredients.map(
          (e) => IngredientItem(ingredient: e),
        ),
        Container(
          height: 16,
          decoration: const BoxDecoration(color: Colors.black12),
        )
      ],
    );
  }
}

class IngredientItem extends StatelessWidget {
  const IngredientItem({required this.ingredient, super.key});

  final Ingredient ingredient;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            const SizedBox(width: 24),
            Text(ingredient.name),
          ],
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Text(ingredient.value),
              const SizedBox(
                width: 8,
              ),
              Text(ingredient.unit),
              const SizedBox(
                width: 8,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
