import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hoivalani/core/config/localizations/constants.dart';
import 'package:hoivalani/core/utils/architecture/data/common_models/attachment.dart';
import 'package:hoivalani/core/utils/assets/app_svg.dart';
import 'package:hoivalani/core/utils/components/buttons/elevated_button.dart';
import 'package:hoivalani/core/utils/components/buttons/enums/button_color.dart';
import 'package:hoivalani/core/utils/components/buttons/enums/button_size.dart';
import 'package:hoivalani/core/utils/custom_widgets/list/atteachment_list/attachment_row.dart';
import 'package:hoivalani/core/utils/helper/platform_helper.dart';

class CustomAttachmentList extends StatefulWidget {
  const CustomAttachmentList(
      {super.key,
      required this.attachments,
      required this.onRemove,
      required this.onAttachLocalFile,
      this.onSaved});

  final List<AttachmentModel> attachments;
  final Function(int) onRemove;
  final Function(File) onAttachLocalFile;
  final Function(List<AttachmentModel>?)? onSaved;

  @override
  State<CustomAttachmentList> createState() => _CustomAttachmentListState();
}

class _CustomAttachmentListState extends State<CustomAttachmentList> {
  @override
  Widget build(BuildContext context) {
    return FormField(
      onSaved: (value) {
        if (widget.onSaved != null) {
          widget.onSaved!.call(widget.attachments);
        }
      },
      builder: (state) => Column(
        children: [
          widget.attachments.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: SizedBox(
                    height: 72,
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.attachments.length,
                      itemBuilder: (context, index) => AttachmentRowWidget(
                        attachment: widget.attachments[index],
                        onRemove: () {
                          widget.onRemove.call(index);
                        },
                      ),
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        width: 8,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomElevatedButton(
                label: appIntl!.attachments,
                buttonColor: ButtonColor.defaults,
                onPressed: () {
                  _uploadFile();
                },
                buttonSize: ButtonSize.small,
                isExpanded: false,
                prefixIcon: AppIcon.attach,
              ),
            ],
          )
        ],
      ),
    );
  }

  void _uploadFile() async {
    File? file = await AppPlatformHelper.pickFile();
    if (file != null) {
      widget.onAttachLocalFile.call(file);
    }
  }
}
