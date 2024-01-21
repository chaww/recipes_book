part of 'edit_menu_bloc.dart';

sealed class EditMenuEvent extends Equatable {
  const EditMenuEvent();

  @override
  List<Object> get props => [];
}

class AddRecipe extends EditMenuEvent {
  const AddRecipe(this.recipe);

  final Recipe recipe;

  @override
  List<Object> get props => [recipe];
}

class ShowDisplayPickImageDialog extends EditMenuEvent {
  const ShowDisplayPickImageDialog();
}

class ImageDelete extends EditMenuEvent {
  const ImageDelete();
}

class NameChange extends EditMenuEvent {
  const NameChange(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}

class CategoryChange extends EditMenuEvent {
  const CategoryChange(this.category);

  final String category;

  @override
  List<Object> get props => [category];
}
