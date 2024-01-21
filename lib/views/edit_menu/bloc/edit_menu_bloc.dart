import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipes_repository/recipes_repository.dart';

part 'edit_menu_event.dart';
part 'edit_menu_state.dart';

class EditMenuBloc extends Bloc<EditMenuEvent, EditMenuState> {
  EditMenuBloc({
    required RecipesRepository recipesRepository,
  })  : _recipesRepository = recipesRepository,
        super(const EditMenuState()) {
    on<AddRecipe>(_onAddRecipe);
    on<ShowDisplayPickImageDialog>(_onShowDisplayPickImageDialog);
    on<ImageDelete>(_onImageDelete);
    on<NameChange>(_onNameChange);
    on<CategoryChange>(_onCategoryChange);
  }

  final RecipesRepository _recipesRepository;

  void _onAddRecipe(
    AddRecipe event,
    Emitter<EditMenuState> emit,
  ) {
    emit(
      state.copyWith(
        recipeHot: () => [...state.recipeHot, event.recipe],
      ),
    );
  }

  Future<void> _onShowDisplayPickImageDialog(
    ShowDisplayPickImageDialog event,
    Emitter<EditMenuState> emit,
  ) async {
    final imagePath = await _recipesRepository.displayPickImageDialog(
      maxHeight: 1600,
      maxWidth: 1600,
    );
    emit(
      state.copyWith(imagePath: () => imagePath != null ? imagePath[0] : ''),
    );
  }

  void _onImageDelete(
    ImageDelete event,
    Emitter<EditMenuState> emit,
  ) {
    emit(
      state.copyWith(
        imagePath: () => '',
      ),
    );
  }

  void _onNameChange(
    NameChange event,
    Emitter<EditMenuState> emit,
  ) {
    emit(
      state.copyWith(
        name: () => event.name,
      ),
    );
  }

  void _onCategoryChange(
    CategoryChange event,
    Emitter<EditMenuState> emit,
  ) {
    emit(
      state.copyWith(
        category: () => event.category,
      ),
    );
  }
}
