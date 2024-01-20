import 'package:flutter/material.dart';
import 'package:recipes_book/views/edit_menu/widgets/widgets.dart';

class MenuSection extends StatelessWidget {
  const MenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          ImageSection(),
          SizedBox(height: 32),
          TextFormField(
            initialValue: '',
            onChanged: (value) {},
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'ชื่อเมนู',
              floatingLabelStyle: TextStyle(fontSize: 22),
            ),
          ),
        ],
      ),
    );
  }
}
