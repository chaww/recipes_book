// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:recipes_api/recipes_api.dart';
import 'package:uuid/uuid.dart';

part 'menu.g.dart';

@JsonSerializable()
class Menu extends Equatable {
  Menu({
    String? id,
    required this.name,
    this.image = '',
    this.category = '',
    required this.recipeList,
  })  : assert(
          id == null || id.isNotEmpty,
          'id must either be null or not empty',
        ),
        id = id ?? const Uuid().v4();

  final String id;
  final String name;
  final String image;
  final String category;
  final List<Recipe> recipeList;

  Menu copyWith({
    String? id,
    String? name,
    String? image,
    String? category,
    List<Recipe>? recipeList,
  }) {
    return Menu(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      category: category ?? this.category,
      recipeList: recipeList ?? this.recipeList,
    );
  }

  static Menu fromJson(JsonMap json) => _$MenuFromJson(json);

  JsonMap toJson() => _$MenuToJson(this);

  @override
  List<Object> get props => [id, name, image, category, recipeList];
}
