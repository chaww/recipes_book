import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: SizedBox(
            height: 200 * 4 / 3,
            width: 200 * 3 / 4,
            child: Center(
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.add_photo_alternate),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
