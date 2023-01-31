import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/view/components/photo_editing.dart';
import 'package:foody/view/components/uploading_photo.dart';
import 'package:provider/provider.dart';

import '../../controller/auth_controller.dart';
import '../style/style.dart';

class CatigoryPhoto extends StatelessWidget {
  const CatigoryPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                context.read<AuthController>().getImageCamera();
              },
              child: Container(
                height: 40.h,
                width: 40.w,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Style.primaryDisabledColor),
                child: const Icon(
                  Icons.photo_camera,
                  color: Style.blackColor,
                ),
              ),
            ),
            10.verticalSpace,
            Text('photo', style: Style.textStyleRegular2()),
             InkWell(
               onTap: () {
                 context.read<AuthController>().getImageGallery();
               },
               child: Container(
                 height: 40.h,
                 width: 40.w,
                 decoration: const BoxDecoration(
                     shape: BoxShape.circle,
                     color: Style.primaryDisabledColor),
                 child: const Icon(
                   Icons.photo,
                   color: Style.blackColor,
                 ),
               ),
             ),
             10.verticalSpace,
             Text('gallery', style: Style.textStyleRegular2()),
          ],
        ),
          context.watch<AuthController>().imagePath.isEmpty
              ? const SizedBox.shrink()
              : Stack(
                  children: [
                    Container(
                      width: 150.w,
                      height: 150.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: FileImage(
                              File(context.watch<AuthController>().imagePath),
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    const PhotoEditing()
                  ],
                ),
      ],
    );
  }
}
