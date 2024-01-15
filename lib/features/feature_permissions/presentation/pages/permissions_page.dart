import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

@RoutePage()
class PermissionsPage extends StatefulWidget {
  const PermissionsPage({super.key});

  @override
  State<PermissionsPage> createState() => _PermissionsPageState();
}

class _PermissionsPageState extends State<PermissionsPage> {
  File? _file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column( children: [
            const SizedBox(height: 16,),
            ElevatedButton.icon(
              onPressed: () async {
                _cameraPermission(context);
              },
              icon: const Icon(Icons.camera),
              label: const Text('camera'),
            ),
            const SizedBox(height: 16,),
            ElevatedButton.icon(
              onPressed: () {
                _galleryPermission(context);
              },
              icon: const Icon(Icons.image),
              label: const Text('gallery'),
            ),
            const SizedBox(height: 16,),

            Expanded(child: _file!=null?Image.file(_file!):Text('please select an photo'))
          ]),
        ),
      ),
    );
  }

  void _cameraPermission(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    PermissionStatus camera = await Permission.camera.request();
    if (camera == PermissionStatus.granted) {
      print('gradient');
      _pickFileFromCamera();
    }
    if (camera == PermissionStatus.denied) {
      print('denied');
      messenger.showSnackBar(SnackBar(
        content: const Text('can not access to camera  '),
        action: SnackBarAction(label: 'open setting', onPressed: () {
          openAppSettings();
        }),
      ));
    }if(camera == PermissionStatus.limited){
      print('limited');
    }if(camera == PermissionStatus.restricted){
      print('restricted');
      messenger.showSnackBar(SnackBar(
        content: const Text('allow us to use camera'),
        action: SnackBarAction(label: 'open setting', onPressed: () {
          openAppSettings();
        }),
      ));
    }}
  void _galleryPermission(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    PermissionStatus gallery = await Permission.photos.request();
    if (gallery == PermissionStatus.granted) {
      print('gradient');
      _pickImageFromGallery();
    }
    if (gallery == PermissionStatus.denied) {
      print('denied');
      messenger.showSnackBar(SnackBar(
        content: const Text('can not access to camera  '),
        action: SnackBarAction(label: 'open setting', onPressed: () {
          openAppSettings();
        }),
      ));
    }if(gallery == PermissionStatus.limited){
      print('limited');
    }if(gallery == PermissionStatus.restricted){
      print('restricted');
      messenger.showSnackBar(SnackBar(
        content: const Text('allow us to use photo'),
        action: SnackBarAction(label: 'open setting', onPressed: () {
          openAppSettings();
        }),
      ));
    }}
  Future _pickImageFromGallery()async{
    final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(returnImage ==null)return;
    setState(() {
      _file = File(returnImage.path);
    });
  }
  Future _pickFileFromCamera()async{
    final returnImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if(returnImage==null)return;
    setState(() {
      _file = File(returnImage.path);
    });
  }
  }

