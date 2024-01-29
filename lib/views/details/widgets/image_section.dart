import 'dart:io';

import 'package:flutter/material.dart';
import 'package:recipes_repository/recipes_repository.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({
    required this.recipe,
    super.key,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: FileImage(File(recipe.image)),
        ),
      ),
    );
  }
}
