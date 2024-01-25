part of 'edit_menu_bloc.dart';

sealed class EditMenuEvent extends Equatable {
  const EditMenuEvent();

  @override
  List<Object> get props => [];
}

class UpdateEditMenuStatus extends EditMenuEvent {
  const UpdateEditMenuStatus(this.status);
  final EditMenuStatus status;

  @override
  List<Object> get props => [status];
}

class UpdateRecipe extends EditMenuEvent {
  const UpdateRecipe({
    required this.recipe,
    this.index = -1,
  });

  final Recipe recipe;
  final int index;

  @override
  List<Object> get props => [recipe];
}

class DeleteRecipe extends EditMenuEvent {
  const DeleteRecipe({
    required this.index,
    required this.type,
  });

  final int index;
  final String type;
}

class EditMenuSubmitted extends EditMenuEvent {
  const EditMenuSubmitted();
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
