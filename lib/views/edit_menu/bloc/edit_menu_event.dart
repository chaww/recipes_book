part of 'edit_menu_bloc.dart';

sealed class EditMenuEvent extends Equatable {
  const EditMenuEvent();

  @override
  List<Object> get props => [];
}

class AddRecipe extends EditMenuEvent {
  const AddRecipe();

  // final Recipe recipe;

  @override
  List<Object> get props => [];
}
