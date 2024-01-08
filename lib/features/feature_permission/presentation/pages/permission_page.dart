import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/core/utils/assets/app_svg.dart';
import 'package:team_project/core/utils/components/buttons/elevated_button.dart';
import 'package:team_project/core/utils/components/buttons/enums/button_size.dart';
import 'package:team_project/core/utils/components/containers/shadowed_container.dart';
import 'package:team_project/core/utils/components/divider/titled_divider.dart';
import 'package:team_project/core/utils/components/text_fields/normal_text_field.dart';
import 'package:team_project/core/utils/components/text_fields/text_area.dart';
import 'package:team_project/core/utils/custom_widgets/text/page_title.dart';
import 'package:team_project/features/feature_permission/data/model/create_permission_request.dart';
import 'package:team_project/features/feature_permission/data/model/delete_permission_request.dart';
import 'package:team_project/features/feature_permission/data/model/get_permission_response.dart';
import 'package:team_project/features/feature_permission/presentation/bloc/presentation_bloc.dart';
import 'package:team_project/features/feature_permission/presentation/bloc/presentation_state.dart';

@RoutePage()
class PermissionPage extends StatefulWidget {
  const PermissionPage({super.key});

  @override
  State<PermissionPage> createState() => _PermissionPageState();
}

class _PermissionPageState extends State<PermissionPage> {
  List<Items> permissions = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isDisable =false;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        actions: [
          AppIcon.notification,
          const SizedBox(
            width: 16,
          ),
          AppIcon.task,
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => PermissionBloc()..loadPermission(),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  primary: false,
                  shrinkWrap: true,
                  children: [
                    const CustomPageTitleWidget(title: 'Permissions'),
                    const SizedBox(
                      height: 16,
                    ),
                    const CustomTitledDivider('Create Permission'),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                      onTap: (){
                      },
                      labelText: 'Title',
                      controller: titleController,
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
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Builder(
                        builder: (context) {
                          return CustomElevatedButton(
                            onPressed: () {
                              context.read<PermissionBloc>().addPermission(CreatePermissionRequest(
                                title: titleController.text,
                                name: descriptionController.text
                              ));
                              titleController.clear();
                              descriptionController.clear();
                            },
                            disabled: isDisable,
                            label: 'add',
                            isExpanded: false,
                            buttonSize: ButtonSize.small,
                          );
                        }
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const CustomTitledDivider(' Permissions'),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: BlocConsumer<PermissionBloc, PermissionState>(
                    builder: (context, state) {
                      if(state is PermissionLoading){
                        return const Center(child: CircularProgressIndicator(),);
                      }
                      if(state is PermissionAdded){
                        context.read<PermissionBloc>().loadPermission();
                      }
                      if(state is PermissionDeleted){
                        context.read<PermissionBloc>().loadPermission();
                      }
                      if(state is PermissionUpdated){
                        context.read<PermissionBloc>().loadPermission();
                      }
                      if(state is PermissionLoaded){
                        return ListView.builder(shrinkWrap: true,itemBuilder: (context,index){
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomShadowedContainer(padding: const EdgeInsets.all(16),child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 32,
                                      height: 32,
                                      decoration: const BoxDecoration(
                                        color: Color(0xffC4CDD5),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(child: Text('${permissions[index].id}',style: theme.textTheme.titleSmall,)),
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                          child: AppIcon.trash,
                                          onTap: (){
                                            showModalBottomSheet(context: context, builder: (_){
                                              return BlocProvider.value(value: BlocProvider.of<PermissionBloc>(context),
                                              child: SizedBox(
                                                height: 188,
                                                width: double.infinity,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 48,
                                                      decoration: const BoxDecoration(
                                                        color: Color.fromRGBO(145, 158, 171, 0.24)
                                                      ),
                                                      child: Center(child: Text('Move To Trash',style: theme.textTheme.titleSmall,),),
                                                    ),
                                                    const SizedBox(height: 16,),
                                                    Center(child: Text('Are you sure about moving this \nitem to trash?',style: theme.textTheme.bodyLarge,textAlign: TextAlign.center,),),
                                                    const SizedBox(height: 16,),
                                                    Container(margin: const EdgeInsets.symmetric(horizontal: 16),
                                                    child: Row(
                                                      children: [
                                                        Expanded(child: ElevatedButton(onPressed: (){
                                                          List<int>ids=[permissions[index].id!];
                                                          context.read<PermissionBloc>().deletePermission(DeletePermissionRequest(
                                                            ids: ids
                                                          ));
                                                          Navigator.of(context).pop();
                                                        }, child: const Text('Confirm'))),
                                                        const SizedBox(width: 24,),
                                                        Expanded(child: ElevatedButton(onPressed: (){
                                                          Navigator.of(context).pop();
                                                        }, child: const Text('Cancel')))
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
                                        const SizedBox(width: 8,),
                                        InkWell(
                                          child: AppIcon.editOutlined,
                                          onTap: (){},
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(height: 16,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Title:',style: theme.textTheme.bodySmall,),
                                    Text("${permissions[index].title}")
                                  ],
                                ),
                                const SizedBox(height: 16,),
                                Text('Description:',style: theme.textTheme.bodySmall,),
                                const SizedBox(height: 16,),
                                Text("${permissions[index].name}")

                              ],
                            )),
                          );
                        },itemCount: permissions.length,);
                      }return Container();
                    }, listener: (context, state) {
                  if(state is PermissionLoaded){
                    permissions = state.getPermissionResponse.items!;
                  }
                }),
              )
            ],
          ),
        ),
      ),
    );
  }

}
