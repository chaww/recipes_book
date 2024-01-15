import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book/views/edit_recipe/bloc/edit_recipe_bloc.dart';

class OptionSection extends StatelessWidget {
  const OptionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final optionSelect = context.watch<EditRecipeBloc>().state.optionSelect;
    final optionValue = context.watch<EditRecipeBloc>().state.optionValue;

    final showOptionName = optionValue != optionSelect.first;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: Column(
        children: [
          const DropdownOption(),
          if (showOptionName)
            const SizedBox(
              height: 16,
            ),
          if (showOptionName)
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ชื่อตัวเลือก',
              ),
            ),
        ],
      ),
    );
  }
}

class DropdownOption extends StatelessWidget {
  const DropdownOption({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final optionSelect = context.read<EditRecipeBloc>().state.optionSelect;

    return LayoutBuilder(
      builder: (context, constraints) => DropdownMenu(
        width: constraints.maxWidth,
        initialSelection: optionSelect.first,
        label: const Text('ตัวเลือก'),
        // inputDecorationTheme: InputDecorationTheme(
        //   filled: true,
        // ),
        onSelected: (e) {
          context.read<EditRecipeBloc>().add(
                OptionSelectOnChanged(optionValue: e ?? optionSelect.first),
              );
        },
        dropdownMenuEntries: optionSelect
            .map((e) => DropdownMenuEntry(value: e, label: e))
            .toList(),
      ),
    );
  }
}
