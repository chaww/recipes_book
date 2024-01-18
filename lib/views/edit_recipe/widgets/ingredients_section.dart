import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_api/recipes_api.dart';
import 'package:recipes_book/views/edit_recipe/bloc/edit_recipe_bloc.dart';

class IngreditntsSection extends StatelessWidget {
  const IngreditntsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<EditRecipeBloc>().state;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ...state.ingredientList.asMap().entries.map(
                (e) => IngredientItem(item: e.value, index: e.key),
              ),
          const IngreditntEdit(),
        ],
      ),
    );
  }
}

class IngredientItem extends StatelessWidget {
  const IngredientItem({
    required this.item,
    required this.index,
    super.key,
  });

  final int index;
  final Ingredient item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => showDialog<String>(
          barrierDismissible: false,
          context: context,
          builder: (_) => IngredientDialog(
            parentContext: context,
            index: index,
          ),
        ),
        child: Row(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    log('onPressed drag_handle');
                  },
                  icon: const Icon(Icons.drag_handle),
                ),
                Text(item.name),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Text(item.value),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(item.unit),
                  const SizedBox(
                    width: 8,
                  ),
                  IconButton(
                    onPressed: () {
                      context
                          .read<EditRecipeBloc>()
                          .add(IngredientDelete(index));
                    },
                    icon: Icon(Icons.delete_forever),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IngreditntEdit extends StatelessWidget {
  const IngreditntEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: FilledButton.tonalIcon(
        onPressed: () => showDialog<String>(
          barrierDismissible: false,
          context: context,
          builder: (_) => IngredientDialog(parentContext: context),
        ),
        icon: const Icon(Icons.add),
        label: const Text('เพิ่มรายการวัตถุดิบใหม่'),
      ),
    );
  }
}

class IngredientDialog extends StatelessWidget {
  const IngredientDialog({
    required this.parentContext,
    super.key,
    this.index = -1,
  });

  final BuildContext parentContext;
  final int index;

  @override
  Widget build(BuildContext context) {
    var name = '';
    var value = '';
    var unit = '';

    if (index >= 0) {
      final state = parentContext.read<EditRecipeBloc>().state;

      name = state.ingredientList[index].name;
      value = state.ingredientList[index].value;
      unit = state.ingredientList[index].unit;
      log('$name $value $unit');
    }

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'วัตถุดิบ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              initialValue: name,
              onChanged: (v) {
                name = v;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('ชื่อวัตถุดิบ'),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: value,
                    onChanged: (v) {
                      value = v;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('ปริมาณ'),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    initialValue: unit,
                    onChanged: (v) {
                      unit = v;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('หน่วย'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'ยกเลิก',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      final item = Ingredient(
                        name: name,
                        value: value,
                        unit: unit,
                      );
                      if (index >= 0) {
                        parentContext
                            .read<EditRecipeBloc>()
                            .add(IngredientEdit(item: item, index: index));
                      } else {
                        parentContext
                            .read<EditRecipeBloc>()
                            .add(IngredientAdd(item));
                      }
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'บันทึก',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
