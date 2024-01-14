import 'package:flutter/material.dart';
import 'package:recipes_book/views/edit_recipe/widgets/widgets.dart';

class EditRecipePage extends StatelessWidget {
  const EditRecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('อเมริกาโน (เย็น)'),
      ),
      body: ListView(
        // shrinkWrap: true,
        children: const <Widget>[
          OptionSection(),
          ImageSection(),
          IngreditntsSection(),
        ],
      ),
    );
  }
}
