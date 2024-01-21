import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book/views/edit_menu/bloc/edit_menu_bloc.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    const imageSize = 200;
    final imagePath = context.watch<EditMenuBloc>().state.imagePath;
    // final imagePath = '';
    return Column(
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          elevation: 5,
          child: SizedBox(
            height: imageSize * 1.2,
            width: imageSize * 1,
            child: Container(
              decoration: imagePath != ''
                  ? BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(File(imagePath)),
                        fit: BoxFit.cover,
                      ),
                    )
                  : null,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // if (imagePath != '')
                  //   FilledButton.tonalIcon(
                  //     onPressed: () async {
                  //       // await displayPickImageDialog();
                  //     },
                  //     icon: Icon(Icons.remove_red_eye_outlined),
                  //     label: Text('ดูรูปภาพ'),
                  //   ),
                  FilledButton.tonalIcon(
                    onPressed: () async {
                      context
                          .read<EditMenuBloc>()
                          .add(const ShowDisplayPickImageDialog());
                    },
                    icon: Icon(imagePath == ''
                        ? Icons.add_photo_alternate
                        : Icons.photo),
                    label:
                        Text(imagePath == '' ? 'เพิ่มรูปภาพ' : 'เปลี่ยนรูปภาพ'),
                  ),
                  if (imagePath != '')
                    FilledButton.tonalIcon(
                      onPressed: () {
                        context.read<EditMenuBloc>().add(const ImageDelete());
                      },
                      icon: Icon(Icons.delete_forever),
                      label: Text('ลบรูปภาพ'),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
