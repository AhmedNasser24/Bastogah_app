import 'dart:io';

import 'package:bastogah_app/core/image_services/images_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/theme/app_images.dart';

class UserProfileLogoImage extends StatefulWidget {
  const UserProfileLogoImage({super.key});

  @override
  State<UserProfileLogoImage> createState() => _UserProfileLogoImageState();
}

class _UserProfileLogoImageState extends State<UserProfileLogoImage> {
  File? fileImage;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectImageSource(context);
      },
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 100,
            width: 100,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: ClipOval(
              child: fileImage == null
                  ? Image.asset(
                      AppImages.imagesUserProfileImage,
                      fit: BoxFit.cover,
                    )
                  : Image.file(fileImage!, fit: BoxFit.cover),
            ),
          ),
          SvgPicture.asset(AppIcons.iconsCameraProfileIcon),
        ],
      ),
    );
  }

  void selectImageSource(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // title: const Text("Select Image Source"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: Text("camera".tr()),
                onTap: () async {
                  fileImage = await ImagesService.pickImage(
                    context: context,
                    source: ImageSource.camera,
                  );
                  if (fileImage != null) {
                    setState(() {});
                  }
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo),
                title: Text("gallery".tr()),
                onTap: () async {
                  fileImage = await ImagesService.pickImage(
                    context: context,
                    source: ImageSource.gallery,
                  );
                  if (fileImage != null) {
                    setState(() {});
                  }
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
