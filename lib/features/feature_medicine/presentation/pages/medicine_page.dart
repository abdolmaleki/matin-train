import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team_project/core/utils/components/containers/shadowed_container.dart';
import 'package:team_project/features/feature_medicine/data/models/medicine_model.dart';
import 'package:team_project/features/feature_medicine/presentation/bloc/medicine_bloc.dart';
import 'package:team_project/features/feature_medicine/presentation/bloc/medicine_state.dart';
import 'package:team_project/features/feature_medicine/presentation/widgets/medicine_list.dart';

@RoutePage()
class MedicinePage extends StatefulWidget {
  const MedicinePage({super.key});

  @override
  State<MedicinePage> createState() => _MedicinePageState();
}

class _MedicinePageState extends State<MedicinePage> {
  List<Items> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => MedicineBloc()..medicineLoaded(),
        child: BlocConsumer<MedicineBloc, MedicineState>(
            listener: (context, state) {
          if (state is MedicineLoaded) {
            setState(() {
              items = state.medicineModel.items!;
            });
          }
        }, builder: (context, state) {
          if (state is MedicineLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is MedicineError) {
            return Center(
              child: Text(state.exception.toString()),
            );
          }
          if (state is MedicineLoaded) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: CustomShadowedContainer(
                      padding: const EdgeInsets.all(16),
                      child: MedicineList(
                          id: items[index].id!,
                          manufacturer: items[index].manufacturer!,
                          availability: items[index].availability!,
                          code: items[index].code!,
                          name: items[index].name!)),
                );
              },
              itemCount: items.length,
            );
          }
          return const Text('some thing is wrong');
        }),
      ),
    );
  }
}
