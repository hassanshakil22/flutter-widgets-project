// READme : this file contains a  file container widget that uses s3 bucket and adds an 
//image to s3 bucket depening on the url and returns a key and path which you can store in
// two variables // imagePath , imageKey ..
// imageKey --> key received from s3 bucket 
// imagePath -->  to keep image path persisted in local & to show it on container !! 


import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widgets/app_setup/core/consts/api_urls.dart';
import 'package:flutter_widgets/app_setup/core/extensions/sizes_extensions.dart';
import 'package:flutter_widgets/app_setup/core/extensions/snackbar_ext.dart';
import 'package:flutter_widgets/app_setup/core/services/http_service.dart';
import 'package:flutter_widgets/app_setup/core/services/s3Service.dart';
import 'package:flutter_widgets/app_setup/themes/app_colors.dart';
import 'package:flutter_widgets/app_setup/utils/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loader_overlay/loader_overlay.dart';

class FileContainer extends StatefulWidget {
  const FileContainer({ 
    super.key,
    required this.text,
    required this.imagePath,
    required this.onFileUploaded,
  });

  final String text;
  final String? imagePath;
  final Future<void> Function(String path, String key) onFileUploaded;

  @override
  State<FileContainer> createState() => _FileContainerState();
}

class _FileContainerState extends State<FileContainer> {
  Future<void> _handleImagePick() async {
    final path = await FilePickerService().pickImage(context);
    if (path == null) return;
    context.loaderOverlay.show();
    try {
      final file = File(path);
      final fileName = file.path.split('/').last;
      const fileType = 'image/jpeg';
      final key = await S3Service(
        httpService: HttpService(),
      ).fileUpload(ApiUrls.dataUpload, file, fileName, fileType);

      await widget.onFileUploaded(path, key);
    } catch (e) {
      debugPrint("Upload error: $e");
      context.showSnackBar(
        "image upload failed ${e.toString()} ",
        color: Colors.redAccent,
      );
    } finally {
      context.loaderOverlay.hide();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _handleImagePick,
      child: Container(
        width: context.wid * 0.44,
        height: context.wid * 0.43,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightGreyColor),
          borderRadius: BorderRadius.circular(8.sp),
          color: AppColors.lightPurpleColor,
        ),
        child: (widget.imagePath != null && widget.imagePath!.isNotEmpty)
            ? Stack(
                children: [
                  Positioned(
                    child: Container(
                      width: context.wid * 0.44,
                      height: context.wid * 0.43,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(File(widget.imagePath!)),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 1,
                    child: SizedBox(
                      width: context.wid * 0.4,
                      child: Text(
                        widget.text,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Gellix",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          height: 1.2125,
                          color: AppColors.textGreyColor,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  const SizedBox(height: 16),
                  Text(widget.text, maxLines: 2, textAlign: TextAlign.center),
                  const SizedBox(height: 8),
                  const Icon(
                    Icons.add,
                    color: AppColors.lightGreyColor,
                    size: 50,
                  ),
                ],
              ),
      ),
    );
  }
}

class FileFormField extends StatelessWidget {
  const FileFormField({
    super.key,
    required this.label,
    required this.imagePath,
    required this.s3Key,
    required this.onFileUploaded,
    required this.validate,
  });

  final String label;
  final String? imagePath;
  final String? s3Key;
  final Future<void> Function(String path, String key) onFileUploaded;
  final bool validate;

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: validate
          ? (value) {
              if (s3Key == null) {
                return 'Please upload $label';
              }
              return null;
            }
          : null,
      builder: (field) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            FileContainer(
              text: validate ? "$label (required)" : "$label  (optional)",
              imagePath: imagePath,
              onFileUploaded: (path, key) async {
                await onFileUploaded(path, key);
                field.didChange(key);
              },
            ),
            if (field.hasError)
              Positioned(
                top: 175,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    field.errorText ?? 'Please select an image',
                    style: const TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
