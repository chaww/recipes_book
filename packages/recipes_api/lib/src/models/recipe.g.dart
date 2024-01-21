// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
      image: json['image'] as String? ?? '',
      type: json['type'] as String? ?? '',
      optionName: json['optionName'] as String? ?? '',
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'image': instance.image,
      'type': instance.type,
      'optionName': instance.optionName,
      'ingredients': instance.ingredients,
    };
