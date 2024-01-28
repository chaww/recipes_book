import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book/views/explore/bloc/explore_bloc.dart';
import 'package:recipes_book/views/explore/widgets/widgets.dart';

class GridBuilder extends StatelessWidget {
  const GridBuilder({super.key, this.filterCategory = ''});

  final String filterCategory;

  @override
  Widget build(BuildContext context) {
    var crossAxisCount = MediaQuery.sizeOf(context).width ~/ 160;
    if (crossAxisCount == 0) crossAxisCount = 1;

    // print(context.watch<ExploreBloc>().state.menuList);

    final menuList = context.watch<ExploreBloc>().state.menuList;
    // final menuListFilter = menuList.where((e) => e.category == filterCategory);
    final menuListFilter = menuList;

    return GridView.count(
      // childAspectRatio: (510/912),
      // childAspectRatio: 408 / 612,
      childAspectRatio: 408 / 612,
      primary: false,
      padding: const EdgeInsets.all(8),
      crossAxisCount: crossAxisCount,
      children: menuListFilter.map((recipe) => MenuItem(menu: recipe)).toList(),
      // children: recipesFilter.map((recipe) => MenuItem(menu: recipe)).toList(),
      // children: [
      //   Text(filterTypeName),
      // ],
    );
  }
}
