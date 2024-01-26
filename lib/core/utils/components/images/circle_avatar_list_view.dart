import 'package:flutter/material.dart';
import 'package:team_project/core/utils/constants/theme/colors.dart';

class CustomCircleAvatarListView extends StatelessWidget {
  final List<String> avatars;

  const CustomCircleAvatarListView(this.avatars, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int listSize = avatars.length > 4 ? 5 : avatars.length;
    double listWidthWithoutBadge = 32 + (28 * (avatars.length - 1));
    double listWidthWithBadge = 32 + (28 * (4));
    bool needShowBadgeCount = avatars.length > 4;
    return SizedBox(
      height: 36,
      width: needShowBadgeCount ? listWidthWithBadge : listWidthWithoutBadge,
      child: ListView.builder(
          itemCount: listSize,
          scrollDirection: Axis.horizontal,
          reverse: true,
          itemBuilder: (context, index) {
            if (index == 0 && needShowBadgeCount) {
              return Align(
                alignment: Alignment.centerRight,
                widthFactor: 0.8,
                child: Container(
                  alignment: Alignment.center,
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      shape: BoxShape.circle,
                      color: AppColors.gray500),
                  child: Text(
                    "+${avatars.length - 4}",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              );
            } else {
              return AvatarRowWidget(avatars[index]);
            }
          }),
    );
  }
}

class AvatarRowWidget extends StatelessWidget {
  final String? avatarUrl;

  const AvatarRowWidget(this.avatarUrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        widthFactor: 0.8,
        child: (avatarUrl != null)
            ? Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
              color:AppColors.gray300 ,
              border: Border.all(color: Colors.white, width: 2),
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(avatarUrl!), fit: BoxFit.fill)),
        )
            : Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color:AppColors.gray300 ,
            border: Border.all(color: Colors.white, width: 2),
            shape: BoxShape.circle,
          ),
        ));
  }
}
