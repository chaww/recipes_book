import 'package:flutter/material.dart';

class OptionsSegment extends StatelessWidget {
  const OptionsSegment({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.coffee),
            title: Text('ร้อน'),
            trailing: Switch(
              onChanged: (bool? value) {},
              value: true,
            ),
          ),
          ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text('เย็น'),
            trailing: Switch(
              onChanged: (bool? value) {},
              value: true,
            ),
          ),
          ListTile(
            leading: Icon(Icons.cyclone),
            title: Text('ปั่น'),
            trailing: Switch(
              onChanged: (bool? value) {},
              value: true,
            ),
          ),
        ],
      ),
    );
  }
}
