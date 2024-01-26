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
            item: item,
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
                      showDialog<void>(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text('ยืนยันการลบ'),
                          // content: const Text('AlertDialog description'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('ยกเลิก'),
                            ),
                            TextButton(
                              onPressed: () {
                                context
                                    .read<EditRecipeBloc>()
                                    .add(IngredientDelete(index));
                                Navigator.pop(context);
                              },
                              child: const Text('ตกลง'),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: const Icon(Icons.delete_forever),
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

class IngredientDialog extends StatefulWidget {
  const IngredientDialog({
    required this.parentContext,
    this.item = const Ingredient(),
    this.index = -1,
    super.key,
  });

  final BuildContext parentContext;
  final int index;
  final Ingredient item;

  @override
  State<IngredientDialog> createState() => _IngredientDialog();
}

class _IngredientDialog extends State<IngredientDialog> {
  late String name;
  late String value;
  late String unit;
  bool showNameValidate = false;

  @override
  void initState() {
    name = widget.item.name;
    value = widget.item.value;
    unit = widget.item.unit;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                setState(() {
                  name = v;
                  showNameValidate = true;
                });
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: const Text('ชื่อวัตถุดิบ'),
                floatingLabelStyle: const TextStyle(fontSize: 22),
                errorText: showNameValidate && name.isEmpty
                    ? 'ต้องมีชื่อวัตถุดิบ'
                    : null,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: value,
                    onChanged: (v) {
                      setState(() {
                        value = v;
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('ปริมาณ'),
                      floatingLabelStyle: TextStyle(fontSize: 22),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    initialValue: unit,
                    onChanged: (v) {
                      setState(() {
                        unit = v;
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('หน่วย'),
                      floatingLabelStyle: TextStyle(fontSize: 22),
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
                      setState(() {
                        showNameValidate = true;
                      });
                      if (name.isNotEmpty) {
                        final item = Ingredient(
                          name: name,
                          value: value,
                          unit: unit,
                        );
                        if (widget.index >= 0) {
                          widget.parentContext.read<EditRecipeBloc>().add(
                                IngredientEdit(item: item, index: widget.index),
                              );
                        } else {
                          widget.parentContext
                              .read<EditRecipeBloc>()
                              .add(IngredientAdd(item));
                        }
                        Navigator.pop(context);
                      } else {}
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
