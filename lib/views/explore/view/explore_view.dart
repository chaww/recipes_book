import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book/views/edit_menu/view/edit_menu_view.dart';
import 'package:recipes_book/views/explore/bloc/explore_bloc.dart';
import 'package:recipes_book/views/explore/widgets/widgets.dart';
import 'package:recipes_book/widgets/Background.dart';
import 'package:recipes_repository/recipes_repository.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExploreBloc(
        recipesRepository: context.read<RecipesRepository>(),
      )..add(const MenuListSubscriptionRequested()),
      child: const _ExploreView(),
    );
  }
}

class _ExploreView extends StatelessWidget {
  const _ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 20);
    final sizeWidth = MediaQuery.sizeOf(context).width;
    const tabsList = ['ทั้งหมด', 'กาแฟ', 'ชา', 'สมูทตี้', 'โซดา', 'อื่นๆ'];

    // print(context.watch<ExploreBloc>().state.menuList);

    return DefaultTabController(
      initialIndex: 0,
      length: tabsList.length,
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('สูตร'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              iconSize: 32,
              onPressed: () {
                Navigator.of(context).push(EditMenuPage.route(menu: Menu()));
              },
            ),
          ],
          bottom: TabBar(
            isScrollable: sizeWidth <= (tabsList.length + 1) * 120,
            tabs: [
              ...List.generate(
                tabsList.length,
                (index) => Tab(
                  child: Text(
                    tabsList[index],
                    style: style,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: BackgroundWidget(
          childWidget: TabBarView(
            children: <Widget>[
              ...List.generate(
                tabsList.length,
                (index) => Center(
                  child: GridBuilder(
                    filterCategory: tabsList[index],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
