import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class PickerScreen extends StatefulWidget {
  const PickerScreen({super.key});

  @override
  State<PickerScreen> createState() => _PickerScreenState();
}

class _PickerScreenState extends State<PickerScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final ImagePicker picker = ImagePicker();
        final XFile? image = await picker.pickImage(
          source: ImageSource.gallery,
          maxHeight: 500,
          maxWidth: 500,
          imageQuality: 40,
        );
        if (image != null) {
          CroppedFile? croppedFile = await ImageCropper().cropImage(
            sourcePath: image.path,
            aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
            aspectRatioPresets: [
              CropAspectRatioPreset.square,
            ],
            uiSettings: [
              AndroidUiSettings(
                toolbarColor: Theme.of(context).colorScheme.primary,
                toolbarWidgetColor: Colors.white,
                toolbarTitle: "Cropper",
                lockAspectRatio: false,
                initAspectRatio: CropAspectRatioPreset.original,
              ),
              IOSUiSettings(
                title: 'Cropper',
              )
            ],
          );
          if (croppedFile != null) {
            setState(() {});
          }
        }
      },
      child: Container(
        padding: const EdgeInsets.only(
          top: 15,
        ),
        width: 50,
        height: 50,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.grey[500]),
        child: const Icon(
          Icons.person_2,
        ),
      ),
    );
  }
}
