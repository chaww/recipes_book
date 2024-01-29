part of 'details_cubit.dart';

class DetailsState extends Equatable {
  const DetailsState({
    required this.menu,
    this.recipeHotList = const [],
    this.recipeIceList = const [],
    this.recipeFrappeList = const [],
    this.recipeHotIndex = 0,
    this.recipeIceIndex = 0,
    this.recipeFrappeIndex = 0,
  });

  final Menu menu;

  final List<Recipe> recipeHotList;
  final List<Recipe> recipeIceList;
  final List<Recipe> recipeFrappeList;

  final int recipeHotIndex;
  final int recipeIceIndex;
  final int recipeFrappeIndex;

  @override
  List<Object> get props => [
        menu,
        recipeHotIndex,
        recipeIceIndex,
        recipeFrappeIndex,
      ];
}
