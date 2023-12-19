// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Menu _$MenuFromJson(Map<String, dynamic> json) => Menu(
      name: json['name'] as String,
      image: json['image'] as String? ?? "",
      category: json['category'] as String? ?? "",
    );

Map<String, dynamic> _$MenuToJson(Menu instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'category': instance.category,
    };

MenuDetail _$MenuDetailFromJson(Map<String, dynamic> json) => MenuDetail(
      recipeList: (json['recipeList'] as List<dynamic>)
          .map((e) => Recipe.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      image: json['image'] as String? ?? "",
      category: json['category'] as String? ?? "",
    );

Map<String, dynamic> _$MenuDetailToJson(MenuDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'category': instance.category,
      'recipeList': instance.recipeList,
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

Ingredient _$IngredientFromJson(Map<String, dynamic> json) => Ingredient(
      name: json['name'] as String,
      amount: json['amount'] as String? ?? "",
      unit: json['unit'] as String? ?? "",
    );

Map<String, dynamic> _$IngredientToJson(Ingredient instance) =>
    <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
      'unit': instance.unit,
    };
