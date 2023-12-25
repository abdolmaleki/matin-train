import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:team_project/core/utils/assets/app_svg.dart';
import 'package:team_project/core/utils/components/containers/shadowed_container.dart';
import 'package:team_project/core/utils/constants/theme/colors.dart';


import 'package:team_project/features/feature_section/presentation/bloc/section_bloc.dart';
import 'package:team_project/features/feature_section/presentation/bloc/section_state.dart';

import '../../../data/model/create_section_response.dart';
import '../../../data/model/get_section_response.dart';
import '../delete_inkwell.dart';


class SectionRowWidget extends StatefulWidget {
  const SectionRowWidget({super.key});

  @override
  State<SectionRowWidget> createState() => _SectionRowWidgetState();
}

class _SectionRowWidgetState extends State<SectionRowWidget> {
  List<Items> getSection = [];
  // List<Children>createSection=[];




  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BlocConsumer<SectionBloc, SectionState>(listener: (context, state) {
      if (state is SectionLoaded) {
        setState(() {
          getSection = state.sectionResponse.items!;
        });
      } if(state is SectionAdded){
        context.read<SectionBloc>().loadSection();
      }

    }, builder: (context, state) {
      return ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: CustomShadowedContainer(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffC4CDD5)),
                            child: Center(
                                child: Text(
                              // createSection[index].id.toString(),
                                  getSection[index].id.toString()!,
                              style: theme.textTheme.titleSmall,
                            )),
                          ),
                          Row(
                            children: [
                              InkWell(
                                child: AppIcon.editOutlined,
                                onTap: () {},
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const DeleteInkWellWidget()
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'title:',
                            style: theme.textTheme.bodyMedium,
                          ),
                          Text(
                            // createSection[index].name!,
                            getSection[index].name!,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Color:',
                            style: theme.textTheme.bodyMedium,
                          ),
                          Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                                color: HexColor(getSection[index].color!),
                                borderRadius: BorderRadius.circular(3)),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Text(
                            'Description:',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Text(
                        // createSection[index].description!,
                        getSection[index].description!,
                        style: theme.textTheme.bodyMedium
                            ?.apply(color: AppColors.primaryLight),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: getSection.length);
    });
  }
}
