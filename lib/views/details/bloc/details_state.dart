part of 'details_bloc.dart';

class DetailsState extends Equatable {
  const DetailsState({
    required this.menu,
    this.recipeHot = const [],
    this.recipeIce = const [],
    this.recipeFrappe = const [],
  });

  final Menu menu;

  final List<Recipe> recipeHot;
  final List<Recipe> recipeIce;
  final List<Recipe> recipeFrappe;

  @override
  List<Object> get props => [];
}
