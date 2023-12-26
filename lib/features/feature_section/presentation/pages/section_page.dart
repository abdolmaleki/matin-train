import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/core/utils/components/divider/titled_divider.dart';
import 'package:team_project/features/feature_section/presentation/bloc/section_bloc.dart';
import 'package:team_project/features/feature_section/presentation/widgets/section_form.dart';
import 'package:team_project/features/feature_section/presentation/widgets/section_list/section_row.dart';


@RoutePage()
class SectionPage extends StatefulWidget {
  const SectionPage({super.key});
  @override
  State<SectionPage> createState() => _SectionPageState();
}

class _SectionPageState extends State<SectionPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SectionBloc>().loadSection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child:  const Column(
          children: [
            SizedBox(
              height: 16,
            ),
            CustomTitledDivider('Create Section'),
            SizedBox(
              height: 16,
            ),
            SectionFormWidget(),
            SizedBox(height: 16,),
            Expanded(child: SectionRowWidget()),
          ],
        ),
      ),
    );
  }


}