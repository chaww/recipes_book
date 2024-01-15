import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    const imageSize = 200;

    return Column(
      children: [
        Card(
          child: SizedBox(
            height: imageSize * 4 / 3,
            width: imageSize * 3 / 4,
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
