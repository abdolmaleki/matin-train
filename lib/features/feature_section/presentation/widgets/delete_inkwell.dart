import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/core/utils/architecture/data/common_models/section.dart';

import '../../../../core/utils/assets/app_svg.dart';
import '../../../../core/utils/components/buttons/elevated_button.dart';
import '../../../../core/utils/components/buttons/enums/button_size.dart';
import '../bloc/section_bloc.dart';

class DeleteInkWellWidget extends StatelessWidget {
   const DeleteInkWellWidget({super.key,required this.section});
  final SectionModel section;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return InkWell(
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
                              context.read<SectionBloc>().removeSection(section);
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
    );
  }
}
