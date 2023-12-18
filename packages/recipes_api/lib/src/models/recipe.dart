import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
// import 'package:meta/meta.dart';
import 'package:recipes_api/recipes_api.dart';

part 'recipe.g.dart';

@JsonSerializable()
class Menu extends Equatable {
  final String name;
  final String image;

  Menu({required this.name, this.image = ""});

  Menu copyWith({
    String? name,
    String? image,
  }) {
    return Menu(
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Menu fromJson(JsonMap json) => _$MenuFromJson(json);

  JsonMap toJson() => _$MenuToJson(this);

  @override
  List<Object> get props => [name, image];
}

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

// class Ingredient {
//   final String name;
//   final String amount;
//   final String unit;
//   final String color;

//   const Ingredient({
//     required this.name,
//     this.amount = "",
//     this.unit = "",
//     this.color = "",
//   });
// }
