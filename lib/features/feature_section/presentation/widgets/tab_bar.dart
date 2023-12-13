
import 'package:flutter/material.dart';
import 'package:team_project/core/utils/custom_widgets/text/page_title.dart';
import 'package:team_project/features/feature_section/presentation/pages/section_page.dart';
import 'package:team_project/features/feature_section/presentation/widgets/team_page.dart';



class TabBarPage extends StatelessWidget {
  List<Widget>tabBarPages =[
     const SectionPage(),
    const TeamPage()
  ];
   TabBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: DefaultTabController(
          length: tabBarPages.length,
          child: SafeArea(
            child: Column(
              children: [
                const CustomPageTitleWidget(title: 'New Team'),
                const TabBar(indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                  Tab(text: 'Section',),
                  Tab(text: 'Team',),
                ]),
                Expanded(child: TabBarView(children: tabBarPages,))
              ],
            ),
          ),
        ),
      );
  }
}

