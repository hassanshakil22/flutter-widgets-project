import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widgets/app_setup/themes/app_colors.dart';
import 'package:image_picker/image_picker.dart';

class FilePickerService {
  final ImagePicker imgPicker = ImagePicker();
  // List<XFile>? pickedFiles;

  Future<String?> pickImage(context) async {
    try {
      final source = await showDialog<ImageSource>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(titleTextStyle: Theme.of(context).textTheme.headlineMedium,
            icon: Icon(Icons.file_upload,),
            title: const Text("Select Image Source"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  tileColor: AppColors.textFieldColor,
                  trailing: Icon(Icons.navigate_next_rounded),
                  leading: const Icon(Icons.camera_alt),
                  title: const Text("Camera",),
                  onTap: () => Navigator.pop(context, ImageSource.camera),
                ),
                ListTile(
                  trailing: Icon(Icons.navigate_next_rounded),
                  tileColor: AppColors.textFieldColor,
                  leading: const Icon(Icons.image),
                  title: const Text("Gallery"),
                  onTap: () => Navigator.pop(context, ImageSource.gallery),
                ),
              ],
            ),
          );
        },
      );
      if (source == null) {
        return null;
      }
      final pickedFile = await imgPicker.pickImage(source: source);
      if (pickedFile != null) {
        return (pickedFile.path);
      } else {
        throw "Null Image Error: Failed to pick the file";
      }
    } catch (e, stackTrace) {
      print("Error : $e $stackTrace");
      rethrow;
    }
  }

  // Future<String> pickFile(
  //     {bool allowImages = true, bool allowDocuments = true}) async {
  //   try {
  //     FilePickerResult? result = await FilePicker.platform.pickFiles(
  //       type: allowImages && allowDocuments
  //           ? FileType.custom
  //           : (allowImages ? FileType.image : FileType.any),
  //       allowedExtensions: allowImages && allowDocuments
  //           ? ['jpg', 'png', 'jpeg', 'pdf', 'doc', 'docx']
  //           : (allowImages ? ['jpg', 'png', 'jpeg'] : ['pdf', 'doc', 'docx']),
  //     );

  //     if (result != null && result.files.single.path != null) {
  //       return result.files.single.path!;
  //     } else {
  //       throw "Null File Error: Failed to pick the file";
  //     }
  //   } catch (e, stackTrace) {
  //     print("Error: $e $stackTrace");
  //     return "Failed to pick file: $e";
  //   }
  // }
}
