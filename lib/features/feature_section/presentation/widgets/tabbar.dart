import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/core/utils/custom_widgets/text/page_title.dart';
import 'package:team_project/features/feature_section/presentation/bloc/section_bloc.dart';
import 'package:team_project/features/feature_section/presentation/pages/section_page.dart';
import 'package:team_project/features/feature_section/presentation/widgets/team.dart';

class TabBarWidget extends StatelessWidget {
  List<Widget> tabBarView = [const SectionPage(), const Team()];

  TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) => SectionBloc(),
      child: DefaultTabController(
        length: tabBarView.length,
        child: SafeArea(
          child: Column(
            children: [
              const CustomPageTitleWidget(title: 'New Team'),
              const TabBar(
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(
                      text: 'Section',
                    ),
                    Tab(
                      text: 'Team',
                    ),
                  ]),
              Expanded(
                  child: TabBarView(
                children: tabBarView,
              ))
            ],
          ),
        ),
      ),
    ));
  }
}
