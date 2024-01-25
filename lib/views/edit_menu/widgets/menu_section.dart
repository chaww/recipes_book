import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book/views/edit_menu/bloc/edit_menu_bloc.dart';
import 'package:recipes_book/views/edit_menu/widgets/widgets.dart';

class MenuSection extends StatelessWidget {
  const MenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<EditMenuBloc>().state;

    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          const ImageSection(),
          const SizedBox(height: 32),
          TextFormField(
            initialValue: state.name,
            onChanged: (value) {
              context.read<EditMenuBloc>().add(NameChange(value));
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'ชื่อเมนู *',
              floatingLabelStyle: TextStyle(fontSize: 22),
            ),
          ),
          const SizedBox(height: 22),
          const DropdownCategory(),
        ],
      ),
    );
  }
}

class DropdownCategory extends StatelessWidget {
  const DropdownCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.read<EditMenuBloc>().state;

    return LayoutBuilder(
      builder: (context, constraints) => DropdownMenu(
        width: constraints.maxWidth,
        initialSelection: state.categoryList.first,
        label: const Text('ประเภท'),
        onSelected: (category) {
          context.read<EditMenuBloc>().add(CategoryChange(category.toString()));
        },
        dropdownMenuEntries: state.categoryList
            .map((e) => DropdownMenuEntry(value: e, label: e))
            .toList(),
      ),
    );
  }
}
