import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/core/utils/assets/app_svg.dart';
import 'package:team_project/core/utils/components/containers/shadowed_container.dart';
import 'package:team_project/core/utils/components/divider/titled_divider.dart';
import 'package:team_project/core/utils/components/images/circle_image.dart';
import 'package:team_project/core/utils/components/labels/enum.dart';
import 'package:team_project/core/utils/components/labels/ghost_label.dart';
import 'package:team_project/core/utils/custom_widgets/text/page_title.dart';
import 'package:team_project/features/fearure_customer/data/model/customer_repository.dart';
import 'package:team_project/features/fearure_customer/presentation/bloc/customer_bloc.dart';
import 'package:team_project/features/fearure_customer/presentation/widgets/custom_button.dart';
import 'package:team_project/features/fearure_customer/presentation/widgets/customer_list.dart';
import 'package:team_project/features/fearure_customer/presentation/widgets/filter_export_button.dart';

import '../../../../core/utils/components/containers/expandable.dart';
import '../bloc/customer_state.dart';

@RoutePage()
class CustomerPage extends StatefulWidget {
  const CustomerPage({super.key});

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  List<Items> customers = [];
  CustomerResponse customerResponse = CustomerResponse();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: BlocProvider(
        create: (context) => CustomerBloc()..loadCustomer(),
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child:  Column(
              children: [
                const CustomPageTitleWidget(title: 'View All Customers'),
                const SizedBox(
                  height: 16,
                ),
                FilterExportWidget(),
                const SizedBox(
                  height: 16,
                ),
                const CustomTitledDivider('Customer'),
                const SizedBox(
                  height: 16,
                ),
                const CustomerList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
