import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipes_repository/recipes_repository.dart';

part 'edit_recipe_event.dart';
part 'edit_recipe_state.dart';

class EditRecipeBloc extends Bloc<EditRecipeEvent, EditRecipeState> {
  EditRecipeBloc({
    required RecipesRepository recipesRepository,
  })  : _recipesRepository = recipesRepository,
        super(EditRecipeInitial()) {
    on<OptionSelectOnChanged>(_optionSelectOnChanged);
  }

  final RecipesRepository _recipesRepository;

  void _optionSelectOnChanged(
    OptionSelectOnChanged event,
    Emitter<EditRecipeState> emit,
  ) {
    emit(state.copyWith(optionValue: () => event.optionValue));
    print('_optionSelectOnChanged');
    print(event.optionValue);
  }
}
