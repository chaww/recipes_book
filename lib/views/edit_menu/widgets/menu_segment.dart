import 'package:flutter/material.dart';

class MenuSegment extends StatelessWidget {
  const MenuSegment({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Card(
            child: SizedBox(
              height: 300,
              width: 200,
              child: Text('image pick'),
            ),
          ),
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
