// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Menu _$MenuFromJson(Map<String, dynamic> json) => Menu(
      name: json['name'] as String,
      image: json['image'] as String? ?? "",
    );

Map<String, dynamic> _$MenuToJson(Menu instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
    };

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
      name: json['name'] as String? ?? "",
      image: json['image'] as String? ?? "",
      type: json['type'] as String? ?? "",
    );

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'type': instance.type,
    };
