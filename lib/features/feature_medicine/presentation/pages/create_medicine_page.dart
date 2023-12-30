import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:team_project/core/utils/assets/app_svg.dart';
import 'package:team_project/core/utils/components/buttons/elevated_button.dart';
import 'package:team_project/core/utils/components/buttons/enums/button_size.dart';
import 'package:team_project/core/utils/components/text_fields/normal_text_field.dart';
import 'package:team_project/core/utils/components/text_fields/text_area.dart';
import 'package:team_project/core/utils/custom_widgets/text/page_title.dart';
import 'package:team_project/features/feature_medicine/data/models/create_medicine_request.dart';
import 'package:team_project/features/feature_medicine/presentation/bloc/medicine_bloc.dart';

@RoutePage()
class CreateMedicinePage extends StatefulWidget {
  const CreateMedicinePage({super.key});

  @override
  State<CreateMedicinePage> createState() => _CreateMedicinePageState();
}

class _CreateMedicinePageState extends State<CreateMedicinePage> {
  final nameController = TextEditingController();
  final codeController = TextEditingController();
  final availabilityController = TextEditingController();
  final manufacturerController = TextEditingController();
  final purposeOfUseController = TextEditingController();
  final instructionController = TextEditingController();
  final sideEffectsController = TextEditingController();
  final conditionsController = TextEditingController();
  final descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        actions: [
          AppIcon.notification,
          const SizedBox(
            width: 18,
          ),
          AppIcon.task,
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: BlocProvider(
        create: (context) => MedicineBloc(),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              const CustomPageTitleWidget(title: 'Create New Medicine'),
              const SizedBox(
                height: 16,
              ),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        labelText: 'Name',
                        controller: nameController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextFormField(
                        labelText: 'Code',
                        controller: codeController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextFormField(
                        labelText: 'Availability',
                        controller: availabilityController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextFormField(
                        labelText: 'Manufacturer',
                        controller: manufacturerController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextArea(
                        label: 'Purpose of Use',
                        controller: purposeOfUseController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextArea(
                        label: 'Instruction',
                        controller: instructionController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextArea(
                        label: 'Side Effects',
                        controller: sideEffectsController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextArea(
                        label: 'Conditions',
                        controller: conditionsController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextArea(
                        label: 'Description',
                        controller: descriptionController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        height: 1,
                        color: const Color.fromRGBO(145, 158, 171, 0.24),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Builder(builder: (context){
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(onPressed: (){}, child: const Text('Cancel'),),
                            const SizedBox(width: 16,),
                            ElevatedButton(onPressed: (){
                              context.read<MedicineBloc>().medicineAdded(CreateMedicineRequest(
                                name: nameController.text,
                                code: codeController.text,
                                manufacturer: manufacturerController.text,
                                availability: availabilityController.text,
                                description: descriptionController.text,
                                conditions: conditionsController.text,
                                instruction: instructionController.text,
                                purposeOfUse: purposeOfUseController.text,
                                sideEffects: sideEffectsController.text,
                              ));
                            }, child: const Text('Create New Medicine'),)
                          ],
                        );
                      })
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
