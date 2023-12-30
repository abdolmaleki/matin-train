import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:team_project/core/utils/assets/app_svg.dart';
import 'package:team_project/core/utils/components/images/circle_image.dart';
import 'package:team_project/core/utils/routes/router.gr.dart';
import 'package:team_project/features/feature_section/presentation/widgets/tabbar.dart';

@RoutePage()
class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            buildItems(context),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CustomCircleImage(
                  imageUrl:
                      "https://static-00.iconduck.com/assets.00/profile-circle-icon-2048x2048-cqe5466q.png",
                  width: 55,
                  height: 55,
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  children: [
                    Text(
                      ' Alex Lee',
                      style: theme.textTheme.headlineLarge,
                    ),
                    Text(
                      'Dispatcher',
                      style:
                          theme.textTheme.bodyLarge!.apply(color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              offset: const Offset(0, 2),
                              blurRadius: 4,
                              spreadRadius: 5)
                        ]),
                    child: Container(
                      margin: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(
                            Icons.person,
                            color: Colors.redAccent,
                            size: 32,
                          ),
                          Text(
                            'Appointments',
                            style: theme.textTheme.bodyLarge!
                                .apply(color: Colors.grey),
                          ),
                          const Text(
                            '800',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              offset: const Offset(0, 2),
                              blurRadius: 4,
                              spreadRadius: 5)
                        ]),
                    child: Container(
                      margin: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.money_off,
                            color: Colors.green,
                            size: 32,
                          ),
                          Text(
                            'Monthly Earning',
                            style: theme.textTheme.labelLarge!
                                .apply(color: Colors.grey),
                          ),
                          const Text(
                            'N100.00',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              'Appointment Request',
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 32,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(0, 2))
                        ]),
                    child: Container(
                      margin: const EdgeInsets.all(16),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('12 jun 25,8pm-10am'),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              const CustomCircleImage(
                                  width: 30,
                                  height: 30,
                                  imageUrl:
                                  'https://static-00.iconduck.com/assets.00/profile-circle-icon-2048x2048-cqe5466q.png'),
                              const SizedBox(width: 8,),
                              Text('Peter P.Meado',style: theme.textTheme.bodyLarge,)
                            ],
                          ),
                          const SizedBox(height: 16,),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: (){},
                                child: const Text('Accept'),
                              ),
                              const SizedBox(width: 16,),
                              ElevatedButton(
                                onPressed: (){},
                                child: const Text('Decline'),
                              ),

                            ],
                          )

                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16,),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(0, 2))
                        ]),
                    child: Container(
                      margin: const EdgeInsets.all(16),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('12 jun 25,8pm-10am'),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              const CustomCircleImage(
                                  width: 30,
                                  height: 30,
                                  imageUrl:
                                  'https://static-00.iconduck.com/assets.00/profile-circle-icon-2048x2048-cqe5466q.png'),
                              const SizedBox(width: 8,),
                              Text('Peter P.Meado',style: theme.textTheme.bodyLarge,)
                            ],
                          ),
                          const SizedBox(height: 16,),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: (){},
                                child: const Text('Accept'),
                              ),
                              const SizedBox(width: 16,),
                              ElevatedButton(
                                onPressed: (){},
                                child: const Text('Decline'),
                              ),

                            ],
                          )

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildItems(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        children: [
          ListTile(
            leading: AppIcon.sections,
            title: const Text('Section'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TabBarWidget()));
            },
          ),
          ListTile(
            leading: AppIcon.customers,
            title: const Text('View All Customer'),
            onTap: () {
              context.router.push(const CustomerRoute());
            },
          ),
          ListTile(
            leading: AppIcon.sections,
            title: const Text('Medicines'),
            onTap: () {
              context.router.push(const MedicineRoute());
            },
          ),
          ListTile(
            leading: AppIcon.sections,
            title: const Text('View All Staff'),
            onTap: () {
              context.router.push(const StaffRoute());
            },
          ),
          ListTile(
            leading: AppIcon.sections,
            title: const Text('Create Medicine'),
            onTap: () {
              context.router.push(const CreateMedicineRoute());
            },
          ),
        ],
      ),
    );
  }
}
