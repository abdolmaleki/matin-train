import 'package:flutter/material.dart';
import 'package:team_project/core/utils/architecture/domain/common_enums/staff_type.dart';
import 'package:team_project/core/utils/components/labels/enum.dart';
import 'package:team_project/core/utils/components/labels/ghost_label.dart';

class CustomStaffLabel extends StatelessWidget {
  const CustomStaffLabel({super.key, required this.staffType});
  final StaffType staffType;

  @override
  Widget build(BuildContext context) {
    switch(staffType){
      case StaffType.doctor:
        return CustomGhostLabel(text:staffType.name , labelType: LabelType.green);
      case StaffType.nurse:
        return CustomGhostLabel(text:staffType.name , labelType: LabelType.yellow);
      case StaffType.janitor:
        return CustomGhostLabel(text:staffType.name , labelType: LabelType.red);
      case StaffType.practicalNurse:
        return CustomGhostLabel(text:staffType.name , labelType: LabelType.blue);
      case StaffType.onCall:
        return CustomGhostLabel(text:staffType.name , labelType: LabelType.secondary);
      case StaffType.supervisor:
        return CustomGhostLabel(text:staffType.name , labelType: LabelType.green);

    }
  }
}
