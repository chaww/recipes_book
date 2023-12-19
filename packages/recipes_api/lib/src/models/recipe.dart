import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:recipes_api/recipes_api.dart';

part 'recipe.g.dart';

// [Menu] -> name, image, categoly
// [MenuDetail] extend Menu -> [List<Recipe>]

@immutable
@JsonSerializable()
class Menu extends Equatable {
  final String name;
  final String image;
  final String category;

  Menu({
    required this.name,
    this.image = "",
    this.category = "",
  });

  Menu copyWith({
    String? name,
    String? image,
    String? category,
  }) {
    return Menu(
      name: name ?? this.name,
      image: image ?? this.image,
      category: category ?? this.category,
    );
  }

  Menu fromJson(JsonMap json) => _$MenuFromJson(json);

  JsonMap toJson() => _$MenuToJson(this);

  @override
  List<Object> get props => [name, image];
}

@immutable
@JsonSerializable()
class MenuDetail extends Menu {
  final List<Recipe> recipeList;

  MenuDetail({
    required this.recipeList,
    required super.name,
    super.image,
    super.category,
  });

  MenuDetail fromJson(JsonMap json) => _$MenuDetailFromJson(json);

  JsonMap toJson() => _$MenuDetailToJson(this);

  @override
  List<Object> get props => super.props..addAll([recipeList]);
}

@immutable
@JsonSerializable()
class Recipe extends Equatable {
  final String name;
  final String image;
  final String type;

  Recipe({
    this.name = "",
    this.image = "",
    this.type = "",
  });

  Recipe copyWith({
    String? name,
    String? image,
    String? type,
  }) {
    return Recipe(
      name: name ?? this.name,
      image: image ?? this.image,
      type: type ?? this.type,
    );
  }

  static Recipe fromJson(JsonMap json) => _$RecipeFromJson(json);

  JsonMap toJson() => _$RecipeToJson(this);

  @override
  List<Object> get props => [name, image, type];
}

@immutable
@JsonSerializable()
class Ingredient extends Equatable {
  final String name;
  final String amount;
  final String unit;

  const Ingredient({
    required this.name,
    this.amount = "",
    this.unit = "",
  });

  Ingredient copyWith({
    String? name,
    String? amount,
    String? unit,
  }) {
    return Ingredient(
      name: name ?? this.name,
      amount: amount ?? this.amount,
      unit: unit ?? this.unit,
    );
  }

  Ingredient fromJson(JsonMap json) => _$IngredientFromJson(json);

  JsonMap toJson() => _$IngredientToJson(this);

  @override
  List<Object> get props => [name, amount, unit];
}
