import 'package:flutter/material.dart';
import 'package:recipes_book/views/edit_recipe/view/edit_recipe_view.dart';

class OptionsSection extends StatelessWidget {
  const OptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Column(
            children: [
              Container(
                // decoration: BoxDecoration(color: Colors.amber),
                width: double.infinity,
                child: const Padding(
                  padding: EdgeInsets.all(18),
                  child: Text(
                    'ประเภทร้อน',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.coffee),
                title: Text('ปกติ'),
                onTap: () {
                  Navigator.of(context).push(EditRecipePage.route());
                },
                trailing: Icon(Icons.navigate_next),
              ),
              FilledButton.tonalIcon(
                onPressed: () => showDialog<String>(
                  barrierDismissible: false,
                  context: context,
                  builder: (_) => Text('data'),
                ),
                icon: const Icon(Icons.add),
                label: Text('เพิ่มสูตรประเภทร้อน'),
              ),
              const SizedBox(height: 16),
            ],
          ),
          Column(
            children: [
              Container(
                // decoration: BoxDecoration(color: Colors.amber),
                width: double.infinity,
                child: const Padding(
                  padding: EdgeInsets.all(18),
                  child: Text(
                    'ประเภทเย็น',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.ac_unit),
                title: Text('ปกติ'),
                onTap: () {
                  Navigator.of(context).push(EditRecipePage.route());
                },
                trailing: Icon(Icons.navigate_next),
              ),
              FilledButton.tonalIcon(
                onPressed: () => showDialog<String>(
                  barrierDismissible: false,
                  context: context,
                  builder: (_) => Text('data'),
                ),
                icon: const Icon(Icons.add),
                label: Text('เพิ่มสูตรประเภทเย็น'),
              ),
              const SizedBox(height: 16),
            ],
          ),
          Column(
            children: [
              Container(
                // decoration: BoxDecoration(color: Colors.amber),
                width: double.infinity,
                child: const Padding(
                  padding: EdgeInsets.all(18),
                  child: Text(
                    'ประเภทปั่น',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.cyclone),
                title: Text('ปกติ'),
                onTap: () {
                  Navigator.of(context).push(EditRecipePage.route());
                },
                trailing: Icon(Icons.navigate_next),
              ),
              FilledButton.tonalIcon(
                onPressed: () => showDialog<String>(
                  barrierDismissible: false,
                  context: context,
                  builder: (_) => Text('data'),
                ),
                icon: const Icon(Icons.add),
                label: Text('เพิ่มสูตรประเภทปั่น'),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ],
      ),
    );
  }
}
