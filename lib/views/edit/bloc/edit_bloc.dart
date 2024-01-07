import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipes_repository/recipes_repository.dart';

part 'edit_event.dart';
part 'edit_state.dart';

class EditBloc extends Bloc<EditEvent, EditState> {
  EditBloc({
    required RecipesRepository recipesRepository,
  })  : _recipesRepository = recipesRepository,
        super(EditInitial()) {
    on<EditEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  final RecipesRepository _recipesRepository;
}
