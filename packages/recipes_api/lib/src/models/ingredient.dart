import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:recipes_api/recipes_api.dart';

part 'ingredient.g.dart';

@JsonSerializable()
class Ingredient extends Equatable {
  final String name;
  final String value;
  final String unit;

  Ingredient({
    required this.name,
    this.value = '',
    this.unit = '',
  });

  Ingredient copyWith({
    String? name,
    String? value,
    String? unit,
  }) {
    return Ingredient(
      name: name ?? this.name,
      value: value ?? this.value,
      unit: unit ?? this.unit,
    );
  }

  static Ingredient fromJson(JsonMap json) => _$IngredientFromJson(json);

  JsonMap toJson() => _$IngredientToJson(this);

  @override
  List<Object> get props => [name, value, unit];
}
