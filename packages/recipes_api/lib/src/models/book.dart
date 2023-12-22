import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:recipes_api/recipes_api.dart';

part 'book.g.dart';

@immutable
@JsonSerializable()
class Book extends Equatable {
  final String name;
  final String image;
  final String category;
  final List<Recipe> recipeList;

  Book({
    required this.name,
    this.image = '',
    this.category = '',
    required this.recipeList,
  });

  Book copyWith({
    String? name,
    String? image,
    String? category,
    List<Recipe>? recipeList,
  }) {
    return Book(
      name: name ?? this.name,
      image: image ?? this.image,
      category: category ?? this.category,
      recipeList: recipeList ?? this.recipeList,
    );
  }

  static Book fromJson(JsonMap json) => _$BookFromJson(json);

  JsonMap toJson() => _$BookToJson(this);

  @override
  List<Object> get props => [name, image, category, recipeList];
}
