import 'package:flutter/material.dart';

class DropdownButtonExpend extends StatelessWidget {
  const DropdownButtonExpend({
    super.key,
    this.list = const ['One', 'Two', 'Three', 'Four'],
  });

  final List<String> list;

  final String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        border: Border.all(color: Colors.black45),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          // isExpanded: true,
          value: dropdownValue,
          icon: const Icon(Icons.arrow_drop_down),
          // borderRadius: BorderRadius.circular(8),
          padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
          onChanged: (String? value) {
            // This is called when the user selects an item.
          },
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
