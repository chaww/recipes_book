import 'package:flutter/material.dart';
import 'package:recipes_book/views/edit_menu/widgets/widgets.dart';

class MenuSection extends StatelessWidget {
  const MenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          ImageSection(),
          TextField(
            decoration: InputDecoration(
              // border: OutlineInputBorder(),
              labelText: 'ชื่อเมนู',
            ),
          ),
        ],
      ),
    );
  }
}
