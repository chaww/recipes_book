import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipes_repository/recipes_repository.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  ExploreBloc({
    required RecipesRepository recipesRepository,
  })  : _recipesRepository = recipesRepository,
        super(const ExploreState()) {
    on<MenuListSubscriptionRequested>(_onSubscriptionMenuList);
  }

  final RecipesRepository _recipesRepository;

  Future<void> _onSubscriptionMenuList(
    MenuListSubscriptionRequested event,
    Emitter<ExploreState> emit,
  ) async {
    await emit.forEach(
      _recipesRepository.getBook(),
      onData: (book) {
        return state.copyWith(menuList: () => book);
      },
    );
  }
}
