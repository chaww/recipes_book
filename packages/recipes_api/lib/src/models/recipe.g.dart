// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
      name: json['name'] as String? ?? '',
      image: json['image'] as String? ?? '',
      type: json['type'] as String? ?? '',
      coffeeType: json['coffeeType'] as String? ?? '',
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'type': instance.type,
      'coffeeType': instance.coffeeType,
      'ingredients': instance.ingredients,
    };
