import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'edit_menu_event.dart';
part 'edit_menu_state.dart';

class EditMenuBloc extends Bloc<EditMenuEvent, EditMenuState> {
  EditMenuBloc() : super(EditMenuInitial()) {
    on<EditMenuEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
