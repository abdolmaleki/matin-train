import 'dart:io';

import 'package:flutter/material.dart';
import 'package:team_project/core/utils/architecture/data/common_models/attachment.dart';
import 'package:team_project/core/utils/components/containers/circle_container.dart';
import 'package:team_project/core/utils/components/images/rounded_image.dart';
import 'package:team_project/core/utils/constants/theme/colors.dart';

class AttachmentRowWidget extends StatelessWidget {
  const AttachmentRowWidget(
      {super.key, required this.attachment, required this.onRemove});

  final AttachmentModel attachment;
  final Function() onRemove;

  @override
  Widget build(BuildContext context) {
    String fileExtension = _getFileExtension();
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        color: AppColors.primaryLighter,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              _getFileExtension(),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .apply(color: AppColors.primary),
            ),
          ),
          if (_isImageAttachment(fileExtension))
            (attachment.type == AttachmentType.local)
                ? CustomRoundedImage(
                    imageProvider: FileImage(
                      File(attachment.address),
                    ),
                    height: 72,
                    width: 72,
                    borderRadius: BorderRadius.circular(8),
                  )
                : CustomRoundedImage(
                    imageProvider: NetworkImage(attachment.address),
                    height: 72,
                    width: 72,
                    borderRadius: BorderRadius.circular(8),
                  ),
          Positioned(
            top: 3,
            right: 4,
            child: GestureDetector(
              onTap: () => onRemove.call(),
              child: CustomCircleContainer(
                  size: 18,
                  color: AppColors.gray200.withOpacity(0.5),
                  child: const Icon(
                    Icons.clear,
                    size: 12,
                  )),
            ),
          )
        ],
      ),
    );
  }

  String _getFileExtension() {
    try {
      List<String> splitPath = attachment.address.split('/');
      String extension = splitPath[splitPath.length - 1].split(".")[1];
      return extension.toUpperCase();
    } catch (e) {
      return "UN";
    }
  }

  bool _isImageAttachment(String fileExtension) {
    return fileExtension.toLowerCase() == "jpg" ||
        fileExtension.toLowerCase() == "png" ||
        fileExtension.toLowerCase() == "webp";
  }
}
