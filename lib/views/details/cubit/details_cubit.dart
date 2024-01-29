import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipes_repository/recipes_repository.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit({
    required Menu menu,
  }) : super(
          DetailsState(
            menu: menu,
            recipeHotList:
                menu.recipeList.where((e) => e.type == 'ร้อน').toList(),
            recipeIceList:
                menu.recipeList.where((e) => e.type == 'เย็น').toList(),
            recipeFrappeList:
                menu.recipeList.where((e) => e.type == 'ปั่น').toList(),
          ),
        );
}
