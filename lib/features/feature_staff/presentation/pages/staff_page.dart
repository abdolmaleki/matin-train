import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/core/utils/assets/app_svg.dart';
import 'package:team_project/core/utils/components/containers/circle_container.dart';
import 'package:team_project/core/utils/components/containers/expandable.dart';
import 'package:team_project/core/utils/components/containers/shadowed_container.dart';
import 'package:team_project/core/utils/components/divider/titled_divider.dart';
import 'package:team_project/core/utils/components/images/circle_avatar.dart';
import 'package:team_project/core/utils/components/images/circle_image.dart';
import 'package:team_project/core/utils/components/labels/enum.dart';
import 'package:team_project/core/utils/components/labels/ghost_label.dart';
import 'package:team_project/core/utils/custom_widgets/text/page_title.dart';
import 'package:team_project/features/feature_staff/data/model/staff_response.dart';
import 'package:team_project/features/feature_staff/presentation/bloc/staff_bloc.dart';
import 'package:team_project/features/feature_staff/presentation/bloc/staff_state.dart';

@RoutePage()
class StaffPage extends StatefulWidget {
  const StaffPage({super.key});

  @override
  State<StaffPage> createState() => _StaffPageState();
}

class _StaffPageState extends State<StaffPage> {
  StaffResponse staffs = StaffResponse();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          actions: [
            AppIcon.notification,
            const SizedBox(
              width: 8,
            ),
            AppIcon.task,
            const SizedBox(
              width: 16,
            )
          ],
        ),
        drawer: const Drawer(),
        body: BlocProvider(
          create: (context) => StaffBloc()..loadStaff(),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const CustomPageTitleWidget(title: 'View All Staff'),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: const BorderSide(
                                        width: 1,
                                        color:
                                            Color.fromRGBO(63, 71, 96, 0.48)))),
                            onPressed: () {},
                            child: Row(
                              children: [
                                AppIcon.export,
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Export',
                                  style: theme.textTheme.titleSmall,
                                )
                              ],
                            ))),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: const BorderSide(
                                        width: 1,
                                        color:
                                            Color.fromRGBO(63, 71, 96, 0.48)))),
                            onPressed: () {},
                            child: Row(
                              children: [
                                AppIcon.filter,
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Filter',
                                  style: theme.textTheme.titleSmall,
                                )
                              ],
                            ))),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const CustomTitledDivider('Staff'),
                const SizedBox(
                  height: 16,
                ),
                BlocConsumer<StaffBloc, StaffState>(
                  listener: (context, state) {
                    if (state is StaffLoaded) {
                      setState(() {
                        staffs = state.staffResponse;
                      });
                    }
                  },
                  builder: (context, state) {
                    if (state is StaffLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is StaffLoaded) {
                      return Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: CustomShadowedContainer(
                                  padding: const EdgeInsets.all(16),
                                  child: CustomExpandablePanel(
                                      header: Row(
                                        children: [
                                          CustomCircleImage(
                                            imageUrl:
                                                '${staffs.items![index].user!.avatarUrl}',
                                            width: 40,
                                            height: 40,
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                "${staffs.items![index].user!.firstName} ${staffs.items![index].user!.lastName}",
                                                style:
                                                    theme.textTheme.titleSmall,
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 16,
                                          ),
                                          CustomGhostLabel(
                                              text:
                                                  '${staffs.items![index].user!.roles?[index].permissions ?? 'Doctor'}',
                                              labelType: LabelType.red)
                                        ],
                                      ),
                                      collapsed: const SizedBox(),
                                      expanded: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Text(
                                            'Profile (10%)',
                                            style: theme.textTheme.labelMedium!
                                                .apply(
                                                    color: const Color(
                                                        0xff637381)),
                                          ),
                                          Stack(
                                            children: [
                                              Container(
                                                height: 4,
                                                color: const Color(0xffFFF7CD),
                                              ),
                                              Container(
                                                height: 4,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    100 *
                                                    55,
                                                color: const Color(0xffFFC107),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Text(
                                            'Progress (10%)',
                                            style: theme.textTheme.labelMedium!
                                                .apply(
                                                    color: const Color(
                                                        0xff637381)),
                                          ),
                                          Stack(
                                            children: [
                                              Container(
                                                height: 4,
                                                color: const Color(0xffFFF7CD),
                                              ),
                                              Container(
                                                height: 4,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    100 *
                                                    55,
                                                color: const Color(0xffFFC107),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                children: [
                                                  CustomCircleContainer(
                                                    color:
                                                        const Color(0xff54D62C),
                                                    size: 20,
                                                    child: Text(
                                                        '${staffs.items![index].grace}',
                                                        style: theme.textTheme
                                                            .labelMedium),
                                                  ),
                                                  Text(
                                                    'Grace',
                                                    style: theme
                                                        .textTheme.bodySmall!
                                                        .apply(
                                                            color: const Color(
                                                                0xff54D62C)),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  CustomCircleContainer(
                                                    color:
                                                        const Color(0xffFFC107),
                                                    size: 20,
                                                    child: Text(
                                                      '${staffs.items![index].warning}',
                                                      style: theme.textTheme
                                                          .labelMedium,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Attention',
                                                    style: theme
                                                        .textTheme.bodySmall!
                                                        .apply(
                                                            color: const Color(
                                                                0xffFFC107)),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  CustomCircleContainer(
                                                    color:
                                                        const Color(0xffFF4842),
                                                    size: 20,
                                                    child: Text(
                                                        '${staffs.items![index].warning}',
                                                        style: theme.textTheme
                                                            .labelMedium!
                                                            .apply(
                                                                color: Colors
                                                                    .white)),
                                                  ),
                                                  Text(
                                                    'Warning',
                                                    style: theme
                                                        .textTheme.bodySmall!
                                                        .apply(
                                                            color: const Color(
                                                                0xffFF4842)),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 16,),
                                          Row(
                                            children: [
                                              AppIcon.phone2,
                                              const SizedBox(width: 16,),
                                              Text("${staffs.items![index].user!.phone}")
                                            ],
                                          )
                                        ],
                                      ))),
                            );
                          },
                          itemCount: staffs.items!.length,
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
