import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipes_repository/recipes_repository.dart';

part 'edit_menu_event.dart';
part 'edit_menu_state.dart';

class EditMenuBloc extends Bloc<EditMenuEvent, EditMenuState> {
  EditMenuBloc() : super(const EditMenuState()) {
    on<AddRecipe>((event, emit) {
      log('AddRecipe Event');
      log(event.recipe.toString());
    });
  }
}
