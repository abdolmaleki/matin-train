import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/core/utils/architecture/data/common_models/section.dart';
import 'package:team_project/core/utils/assets/app_svg.dart';
import 'package:team_project/core/utils/components/buttons/elevated_button.dart';
import 'package:team_project/core/utils/components/buttons/enums/button_size.dart';
import 'package:team_project/core/utils/components/containers/shadowed_container.dart';
import 'package:team_project/core/utils/constants/theme/colors.dart';
import 'package:team_project/features/feature_section/presentation/bloc/section_bloc.dart';
import 'package:team_project/features/feature_section/presentation/bloc/section_state.dart';

class SectionRowWidget extends StatefulWidget {
  const SectionRowWidget({super.key});

  @override
  State<SectionRowWidget> createState() => _SectionRowWidgetState();
}

class _SectionRowWidgetState extends State<SectionRowWidget> {
  List<SectionModel> section = [];

  get index => section[index];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SectionBloc>().loadSection();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BlocConsumer<SectionBloc, SectionState>(listener: (context, state) {
      if (state is SectionLoaded) {
        setState(() {
          section = state.section;
        });
        if (state is SectionAdded) {
          context.read<SectionBloc>().loadSection();
        }
        if (state is SectionRemoved) {}
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
                              section[index].number.toString(),
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
                              InkWell(
                                child: AppIcon.trash,
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (_) {
                                        return BlocProvider.value(
                                          value: BlocProvider.of<SectionBloc>(
                                              context),
                                          child: SizedBox(
                                            height: 188,
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 48,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                      color:
                                                          const Color.fromRGBO(
                                                              145,
                                                              158,
                                                              171,
                                                              0.24)),
                                                  child: const Center(
                                                    child: Text(
                                                      'Move to Trash',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 13,
                                                          color: Color(
                                                              0xff000000)),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 16,),
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Text('Are you sure about moving this \n item to trash? ',style: theme.textTheme.bodyLarge,),
                                                ),
                                                const SizedBox(height: 16,),
                                                Container(
                                                  margin: const EdgeInsets.symmetric(horizontal: 20),
                                                  child: Row(
                                                    children: [
                                                      Expanded(child: CustomElevatedButton(onPressed: (){
                                                        context.read<SectionBloc>().removeSection(section[index]);
                                                        Navigator.of(context).pop();
                                                      }, label: 'Confirm', buttonSize: ButtonSize.medium,)),
                                                      const SizedBox(width:16 ,),
                                                      Expanded(child: CustomElevatedButton(onPressed: (){
                                                        Navigator.of(context).pop();
                                                      }, label: 'Cancel', buttonSize: ButtonSize.medium,)),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                              ),
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
                            section[index].title,
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
                                color: Colors.red,
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
                        section[index].description,
                        style: theme.textTheme.bodyMedium
                            ?.apply(color: AppColors.primaryLight),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: section.length);
    });
  }
}
