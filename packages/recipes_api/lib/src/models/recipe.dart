import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:recipes_api/recipes_api.dart';

part 'recipe.g.dart';

@JsonSerializable()
class Recipe extends Equatable {
  final String image;
  final String type;
  final String optionName;
  final List<Ingredient> ingredients;

  Recipe({
    this.image = '',
    this.type = '',
    this.optionName = '',
    this.ingredients = const [],
  });

  Recipe copyWith({
    String? image,
    String? type,
    String? optionName,
    List<Ingredient>? ingredients,
  }) {
    return Recipe(
      image: image ?? this.image,
      type: type ?? this.type,
      optionName: optionName ?? this.optionName,
      ingredients: ingredients ?? this.ingredients,
    );
  }

  static Recipe fromJson(JsonMap json) => _$RecipeFromJson(json);

  JsonMap toJson() => _$RecipeToJson(this);

  @override
  List<Object> get props => [image, type, optionName, ingredients];
}
