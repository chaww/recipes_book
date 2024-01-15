import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book/views/edit_recipe/bloc/edit_recipe_bloc.dart';

class OptionSection extends StatelessWidget {
  const OptionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<EditRecipeBloc>().state;
    final showOptionName = state.optionValue != state.optionSelect.first;

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
            TextFormField(
              initialValue: state.optionName,
              onChanged: (value) {
                context.read<EditRecipeBloc>().add(OptionNameOnChange(value));
              },
              decoration: const InputDecoration(
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
                OptionSelectOnChanged(e ?? optionSelect.first),
              );
        },
        dropdownMenuEntries: optionSelect
            .map((e) => DropdownMenuEntry(value: e, label: e))
            .toList(),
      ),
    );
  }
}
