import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizing/sizing.dart';

Future modalBottomSheetMenu(BuildContext context, Function onImageSelected,{bool? isFront = false}) async {
  XFile? choosedImage;
  await showModalBottomSheet(
      backgroundColor: Get.theme.colorScheme.onPrimary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      context: context,
      builder: (builder) {
        return Container(
          height: 187.0.ss,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25.0),
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                children: [
                  Container(height: 10.ss,),
                  Container(
                    width: 54,
                    height: 3,
                    decoration: ShapeDecoration(
                      color: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                  Container(height: 30.ss,),
                  ElevatedButton(
                    style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all<Size>(
                          Size(335.0.ss, 48.0.ss), // Set the desired width and height
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0), // Adjust the value as needed
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
                    onPressed: () async {
                      Get.back();
                      debugPrint("Camera button pressed");
                      choosedImage = await  openCamera(context,isFront: isFront);
                      onImageSelected(choosedImage);
                    },
                    child: Text("Take Photo",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15,color: Colors.white),),
                  ),
                  Container(height: 10.ss,),
                  ElevatedButton(
                    style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all<Size>(
                          Size(335.0.ss, 48.0.ss), // Set the desired width and height
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0), // Adjust the value as needed
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.grey)),
                    onPressed: () async {
                      Get.back();
                      debugPrint("Gallery button pressed");
                      choosedImage = await _getFromGallery();
                      onImageSelected(choosedImage);
                    },
                    child: Text("Add photo from library",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 15),),
                  ),
                ],
              ),
            ),
          ),
        );
      });
  // return choosedImage;
}

Future<XFile?> openGallery(context) async {
  // Check if the storage permission is already granted
  PermissionStatus status = await Permission.storage.status;
  if (status.isGranted) {
    // Permission is already granted, open the gallery
    return _getFromGallery();
  } else if (status.isDenied) {
    // Permission is denied, show a dialog to request permission again
    showPermissionDialog(context);
  } else {
    // Permission is not determined, request the storage permission
    PermissionStatus requestedStatus = await Permission.storage.request();
    if (requestedStatus.isGranted) {
      // Permission granted, open the gallery
      return _getFromGallery();
    } else if (requestedStatus.isPermanentlyDenied) {
      // Permission denied permanently, show a dialog to redirect to app settings
      showSettingsDialog(context);
    } else {
      // Permission denied, handle accordingly
      print('Gallery permission denied');
    }
  }
}

Future<XFile?> openCamera(context,{bool? isFront = false}) async {
  // Check if the camera permission is already granted
  PermissionStatus status = await Permission.camera.status;
  if (status.isGranted) {
    // Permission is already granted, open the camera
    return _getFromCamera(isFront: isFront);
  } else if (status.isDenied) {
    // Permission is denied, show a dialog to request permission again
    showPermissionDialog(context);
  } else {
    // Permission is not determined, request the camera permission
    PermissionStatus requestedStatus = await Permission.camera.request();
    if (requestedStatus.isGranted) {
      // Permission granted, open the camera
      return _getFromCamera(isFront: isFront);
    } else if (requestedStatus.isPermanentlyDenied) {
      // Permission denied permanently, show a dialog to redirect to app settings
      showSettingsDialog(context);
    } else {
      // Permission denied, handle accordingly
      print('Camera permission denied');
    }
  }
}

void showSettingsDialog(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Permission Required'),
        content: const Text(
            'Camera permission is required. Please enable it in the app settings.'),
        actions: [
          TextButton(
            child: const Text('CANCEL'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('SETTINGS'),
            onPressed: () {
              Navigator.of(context).pop();
              openAppSettings(); // Open app settings page
            },
          ),
        ],
      );
    },
  );
}

void showPermissionDialog(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Permission Required'),
        content: const Text('This app requires access to the camera.'),
        actions: [
          TextButton(
            child: const Text('CANCEL'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('SETTINGS'),
            onPressed: () {
              Navigator.of(context).pop();
              openAppSettings(); // Open app settings page
            },
          ),
        ],
      );
    },
  );
}

Future<XFile?> _getFromGallery() async {
  XFile? selectedImage;
  selectedImage = (await ImagePicker().pickImage(
    source: ImageSource.gallery,
    maxWidth: 1800,
    maxHeight: 1800,
  ));
  if (selectedImage != null) {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: selectedImage.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio7x5,
      ],
      compressQuality: 100, // Set the compression quality
    );

    // Convert the File to XFile
    if (croppedImage != null) {
      return XFile(croppedImage.path);
    }
  }
  return null;
}

Future<XFile?> _getFromCamera({bool? isFront= false}) async {
  print("ISFRONT:$isFront");
  XFile? selectedImage;

  // Pick image from the camera
  selectedImage = await ImagePicker().pickImage(
    source: ImageSource.camera,
    preferredCameraDevice: (isFront ?? false)?CameraDevice.front:CameraDevice.rear,
    maxWidth: 1800,
    maxHeight: 1800,
  );

  // Check if an image was selected
  if (selectedImage != null) {
    // Crop the selected image
    CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: selectedImage.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio7x5,
      ],
      compressQuality: 100, // Set the compression quality
    );

    // Convert the File to XFile
    if (croppedImage != null) {
      return XFile(croppedImage.path);
    }
  }

  // Return null if no image was selected or cropping was canceled
  return null;
}