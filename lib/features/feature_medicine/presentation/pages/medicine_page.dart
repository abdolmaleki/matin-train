import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/features/feature_medicine/presentation/bloc/medicine_bloc.dart';
import 'package:team_project/features/feature_medicine/presentation/bloc/medicine_state.dart';

@RoutePage()
class MedicinePage extends StatefulWidget {
  const MedicinePage({super.key});

  @override
  State<MedicinePage> createState() => _MedicinePageState();
}

class _MedicinePageState extends State<MedicinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => MedicineBloc(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Builder(builder: (context) {
                return ElevatedButton(
                    onPressed: () {
                      context.read<MedicineBloc>().medicineLoaded();
                    },
                    child: const Text('getMedicine'));
              }),
              BlocBuilder<MedicineBloc,MedicineState>(builder: (context,state){
                if(state is MedicineLoading){
                  return const CircularProgressIndicator();
                }else if(state is MedicineLoaded){
                  return Text(state.medicineModel.name);
                }else if(state is MedicineError){
                  return Text(state.exception.toString());
                }
                return const Text('error');
              })
            ],
          ),
        ),
      ),
    );
  }
}
