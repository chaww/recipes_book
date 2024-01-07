import 'package:flutter/material.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  final String title = 'explore';

  @override
  State<ExploreView> createState() => _ExploreView();
}

class _ExploreView extends State<ExploreView> {
  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 20);
    // final sizeWidth = MediaQuery.sizeOf(context).width;

    return DefaultTabController(
      initialIndex: 0,
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          bottom: const TabBar(
            // isScrollable: sizeWidth <= (typeList.length + 1) * 120,
            tabs: <Widget>[
              Tab(
                child: Text(
                  'data',
                  style: style,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
