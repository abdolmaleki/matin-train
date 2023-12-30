import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/core/utils/components/overlay/pop_up_menu_button.dart';

import '../../../../core/utils/assets/app_svg.dart';
import '../../../../core/utils/components/containers/expandable.dart';
import '../../../../core/utils/components/containers/shadowed_container.dart';
import '../../../../core/utils/components/images/circle_image.dart';
import '../../../../core/utils/components/labels/enum.dart';
import '../../../../core/utils/components/labels/ghost_label.dart';
import '../../data/model/customer_repository.dart';
import '../bloc/customer_bloc.dart';
import '../bloc/customer_state.dart';

class CustomerList extends StatefulWidget {
  const CustomerList({super.key});

  @override
  State<CustomerList> createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  CustomerResponse customer = CustomerResponse();
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BlocConsumer<CustomerBloc, CustomerState>(
        listener: (context, state) {
          if (state is CustomerLoaded) {
            setState(() {
              customer = state.customerResponse;
            });
          }
        },
        builder: (BuildContext context, CustomerState state) {
          if(state is CustomerLoading){
            return const Center(child: CircularProgressIndicator(),);
          }if(state is CustomerLoaded){
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return CustomShadowedContainer(
                      child: CustomExpandablePanel(
                        header: Container(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CustomCircleImage(
                                    imageUrl:
                                    customer.items![index].user!.avatarUrl!,
                                    // "https://static-00.iconduck.com/assets.00/profile-circle-icon-2048x2048-cqe5466q.png",
                                    width: 40,
                                    height: 40,
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    "${customer.items![index].user!.firstName} ${customer.items![index].user!.lastName}",
                                    style: theme.textTheme.titleSmall!
                                        .apply(
                                        color: const Color(0xff212B36)),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              CustomPopupMenuButton(
                                items: [
                                  CustomPopupMenuItem(
                                      text: 'View Profile', icon: AppIcon.id),
                                  CustomPopupMenuItem(
                                      text:" Edit Customer", icon: AppIcon.editOutlined),
                                  CustomPopupMenuItem(
                                      text: "Staff Details", icon: AppIcon.role),
                                  CustomPopupMenuItem(
                                      text: "Add Absence", icon: AppIcon.removeUser),
                                ],
                                onSelected: (index) {

                                }, icon: AppIcon.more,
                              )
                            ],
                          ),
                        ),
                        expanded: Container(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Progress (60%)',
                                    style: theme.textTheme.labelMedium!
                                        .apply(
                                        color: const Color(0xff637381)),
                                  )),
                              Stack(
                                children: [
                                  Container(
                                    height: 4,
                                    color: const Color(0xffFFF7CD),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                        color: Color(0xffFFC107),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(2),
                                            bottomRight:
                                            Radius.circular(2))),
                                    height: 4,
                                    width:
                                    MediaQuery.of(context).size.width /
                                        100 *
                                        60,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                'Diagnoses: ${customer.items![index].diagnoses?[index].diagnose ?? 'Asthma-Diabetes-Osteoporosis'}',
                                style: theme.textTheme.bodyMedium,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                children: [
                                  const Text('Nurse Needed:'),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  CustomGhostLabel(
                                      text:
                                      '${customer.items![index].services?[index].nurseWish ?? 'Practical Nurse'}',
                                      labelType: LabelType.blue)
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                children: [
                                  AppIcon.phone2,
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  // Text("${customers[index].user!.phone}",style: theme.textTheme.bodyMedium,)
                                  Text(
                                    '${customer.items![index].user!.phone}',
                                    style: theme.textTheme.bodyMedium,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              )
                            ],
                          ),
                        ),
                        collapsed: const SizedBox(),
                        theme: const ExpandableThemeData(
                          hasIcon: false,
                        ),
                      ));
                },
                itemCount: customer.items?.length,
              ),
            );
          }return Container();
        },

    );
  }
}
