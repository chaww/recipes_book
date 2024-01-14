import 'package:flutter/material.dart';

class OptionSection extends StatelessWidget {
  const OptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownOption(),
              // SizedBox(
              //   height: 8,
              // ),
              TextField(
                decoration: InputDecoration(
                  // border: OutlineInputBorder(),
                  labelText: 'ชื่อตัวเลือก',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const List<String> list = <String>['ไม่ระบุ', 'เพิ่มตัวเลือกใหม่'];

class DropdownOption extends StatelessWidget {
  const DropdownOption({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => DropdownMenu(
        width: constraints.maxWidth,
        initialSelection: list.first,
        label: const Text('ตัวเลือก'),
        inputDecorationTheme: InputDecorationTheme(
            // filled: true,
            ),
        onSelected: (e) {},
        dropdownMenuEntries:
            list.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
      ),
    );
  }
}
