import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book/views/details/cubit/details_cubit.dart';
import 'package:recipes_book/views/details/widgets/widgets.dart';
import 'package:recipes_repository/recipes_repository.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({required this.menu, super.key});

  final Menu menu;

  static Route<void> route({required Menu menu}) {
    return MaterialPageRoute(
      builder: (context) => DetailsPage(menu: menu),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsCubit(
        // recipesRepository: context.read<RecipesRepository>(),
        menu: menu,
      ),
      child: const DetailsView(),
    );
  }
}

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 20);

    // final state = context.read<DetailsBloc>().state;
    final state = context.select((DetailsCubit cubit) => cubit.state);

    final tabsList = <String>[];
    if (state.recipeHotList.isNotEmpty) tabsList.add('ร้อน');
    if (state.recipeIceList.isNotEmpty) tabsList.add('เย็น');
    if (state.recipeFrappeList.isNotEmpty) tabsList.add('ปั่น');

    final isIceIndex = tabsList.indexOf('เย็น');

    return DefaultTabController(
      initialIndex: isIceIndex > -1 ? isIceIndex : 0,
      length: tabsList.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('title'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
          bottom: TabBar(
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
        body: PopScope(
          canPop: false,
          onPopInvoked: (didPop) async {
            if (didPop) return;
            Navigator.of(context).pop();
          },
          child: TabBarView(
            children: <Widget>[
              ...List.generate(
                tabsList.length,
                (index) => TabBarViewItem(type: tabsList[index]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabBarViewItem extends StatelessWidget {
  const TabBarViewItem({
    required this.type,
    super.key,
  });

  final String type;

  @override
  Widget build(BuildContext context) {
    final state = context.select((DetailsCubit cubit) => cubit.state);
    var recipe = const Recipe();
    if (type == 'ร้อน') {
      recipe = state.recipeHotList[state.recipeHotIndex];
    } else if (type == 'เย็น') {
      recipe = state.recipeIceList[state.recipeIceIndex];
    } else if (type == 'ปั่น') {
      recipe = state.recipeFrappeList[state.recipeFrappeIndex];
    }

    return ListView(
      shrinkWrap: true,
      children: [
        ImageSection(recipe: recipe),
        _spaceDivider(),
        // OptionNameSection(),
        _spaceDivider(),
        IngredientsSection(recipe: recipe),
      ],
    );
  }

  Widget _spaceDivider() {
    return Container(
      height: 16,
      decoration: const BoxDecoration(color: Colors.black12),
    );
  }
}
