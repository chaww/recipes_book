import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:recipes_api/recipes_api.dart';

part 'recipe.g.dart';

@immutable
@JsonSerializable()
class Recipe extends Equatable {
  final String name;
  final String image;
  final String type;
  final String coffeeType;
  final List<Ingredient> ingredients;

  Recipe({
    this.name = '',
    this.image = '',
    this.type = '',
    this.coffeeType = '',
    required this.ingredients,
  });

  Recipe copyWith({
    String? name,
    String? image,
    String? type,
    String? coffeeType,
    List<Ingredient>? ingredients,
  }) {
    return Recipe(
      name: name ?? this.name,
      image: image ?? this.image,
      type: type ?? this.type,
      coffeeType: coffeeType ?? this.coffeeType,
      ingredients: ingredients ?? this.ingredients,
    );
  }

  static Recipe fromJson(JsonMap json) => _$RecipeFromJson(json);

  JsonMap toJson() => _$RecipeToJson(this);

  @override
  List<Object> get props => [name, image, type, coffeeType, ingredients];
}
