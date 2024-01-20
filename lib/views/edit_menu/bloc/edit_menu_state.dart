part of 'edit_menu_bloc.dart';

enum EditMenuStatus { initial, loading, success, failure }

class EditMenuState extends Equatable {
  const EditMenuState({
    this.status = EditMenuStatus.initial,
  });

  final EditMenuStatus status;

  final String imagePath;
  final String name;
  final String category;
  final List<List<Recipe>> recipeCollection;

  @override
  List<Object> get props => [status];
}
