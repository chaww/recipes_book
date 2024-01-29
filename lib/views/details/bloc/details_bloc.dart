import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipes_repository/recipes_repository.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc({
    required Menu menu,
  }) : super(
          DetailsState(
            menu: menu,
            recipeHot: menu.recipeList.where((e) => e.type == 'ร้อน').toList(),
            recipeIce: menu.recipeList.where((e) => e.type == 'เย็น').toList(),
            recipeFrappe:
                menu.recipeList.where((e) => e.type == 'ปั่น').toList(),
          ),
        ) {
    // on<DetailsEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
  }
}
