import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

class ImageSection extends StatefulWidget {
  const ImageSection({super.key});

  @override
  State<ImageSection> createState() => _ImageSectionState();
}

class _ImageSectionState extends State<ImageSection> {
  // const _ImageSectionState({super.key});

  var path = '';

  Future<void> displayPickImageDialog() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1600,
      maxHeight: 1600,
    );
    final mediaFileList = image == null ? null : <XFile>[image];
    final mime = lookupMimeType(mediaFileList![0].path);

    setState(() {
      path = mediaFileList![0].path;
    });

    log(mediaFileList![0].path);
  }

  @override
  Widget build(BuildContext context) {
    const imageSize = 200;

    return Column(
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          elevation: 5,
          child: SizedBox(
            height: imageSize * 1.2,
            width: imageSize * 1,
            child: Container(
              decoration: path != ''
                  ? BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(File(path)),
                        fit: BoxFit.cover,
                      ),
                    )
                  : null,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // if (path != '')
                  //   FilledButton.tonalIcon(
                  //     onPressed: () async {
                  //       // await displayPickImageDialog();
                  //     },
                  //     icon: Icon(Icons.remove_red_eye_outlined),
                  //     label: Text('ดูรูปภาพ'),
                  //   ),
                  FilledButton.tonalIcon(
                    onPressed: () async {
                      await displayPickImageDialog();
                    },
                    icon: Icon(
                        path == '' ? Icons.add_photo_alternate : Icons.photo),
                    label: Text(path == '' ? 'เพิ่มรูปภาพ' : 'เปลี่ยนรูปภาพ'),
                  ),
                  if (path != '')
                    FilledButton.tonalIcon(
                      onPressed: () {
                        setState(() {
                          path = '';
                        });
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
