import 'package:flutter/material.dart';

class IngreditntsSection extends StatelessWidget {
  const IngreditntsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          IngredientItems(),
          IngreditntEdit(),
        ],
      ),
    );
  }
}

class IngredientItems extends StatelessWidget {
  const IngredientItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.drag_handle),
              ),
              Text('ชื่อ'),
            ],
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Text('15'),
                SizedBox(
                  width: 8,
                ),
                Text('ML'),
                SizedBox(
                  width: 8,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete_forever),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IngreditntEdit extends StatelessWidget {
  const IngreditntEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: FilledButton.tonalIcon(
        onPressed: () => showDialog<String>(
          // barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => Dialog(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('ชื่อวัตถุดิบ'),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text('ปริมาณ'),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
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
          ),
        ),
        icon: Icon(Icons.add),
        label: Text('เพิ่มรายการวัตถุดิบใหม่'),
      ),
    );
  }
}
