import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:recipes_api/recipes_api.dart';

part 'menu.g.dart';

@immutable
@JsonSerializable()
class Menu extends Equatable {
  final String name;
  final String image;
  final String category;
  final List<Recipe> recipeList;

  Menu({
    required this.name,
    this.image = '',
    this.category = '',
    required this.recipeList,
  });

  Menu copyWith({
    String? name,
    String? image,
    String? category,
    List<Recipe>? recipeList,
  }) {
    return Menu(
      name: name ?? this.name,
      image: image ?? this.image,
      category: category ?? this.category,
      recipeList: recipeList ?? this.recipeList,
    );
  }

  static Menu fromJson(JsonMap json) => _$MenuFromJson(json);

  JsonMap toJson() => _$MenuToJson(this);

  @override
  List<Object> get props => [name, image, category, recipeList];
}
