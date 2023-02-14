import 'dart:convert';
import 'dart:io';

import 'package:cocreator/pages/bottom_bar.dart';
import 'package:cocreator/pages/screens/socialmedia/enums/snackbar_message.dart';
import 'package:cocreator/helpers/my_file_picker.dart';
import 'package:cocreator/pages/screens/socialmedia/home/home_screen_social.dart';
import 'package:cocreator/pages/screens/socialmedia/services/http_service.dart';
import 'package:cocreator/pages/screens/socialmedia/socialhome.dart';
import 'package:cocreator/pages/screens/socialmedia/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class AddBlogController extends GetxController {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController titleController;
  late final TextEditingController bodyController;

  RxBool loading = false.obs;
  Rx<File?> imageFile = Rx<File?>(null);

  final HttpService httpService = HttpService();

  @override
  void onInit() {
    super.onInit();
    titleController = TextEditingController();
    bodyController = TextEditingController();
  }

  @override
  void onClose() {
    titleController.dispose();
    bodyController.dispose();
    super.onClose();
  }

  void addPost() async {
    if (formKey.currentState!.validate()) {
      if (imageFile.value != null) {
        try {
          loading(true);
          Map<String, String> data = {
            'title': titleController.text.trim(),
            'body': bodyController.text.trim(),
          };
          http.Response response =
              await httpService.post('/blogPost/add', data);
          var jsonData = json.decode(response.body);
          if (response.statusCode == 200 || response.statusCode == 201) {
            uploadImage(jsonData['data']);
          } else if (response.statusCode == 500) {
            loading(false);
            showSnackbar(SnackbarMessage.error, jsonData['msg']);
          } else {
            loading(false);
            showSnackbar(SnackbarMessage.error, 'Unknown Error Occured');
          }
        } catch (e) {
          loading(false);
          showSnackbar(SnackbarMessage.error, e.toString());
        }
      } else {
        showSnackbar(SnackbarMessage.missing, 'Please upload image');
      }
    }
  }

  void uploadImage(String id) async {
    http.StreamedResponse response = await httpService.patchImage(
        '/blogPost/add/coverImage/$id', imageFile.value!.path);
    if (response.statusCode == 200 || response.statusCode == 201) {
      loading(false);

      Get.offAll(() => const BottomBar());

      showSnackbar(SnackbarMessage.success, 'Blog Added Successfully');
    } else if (response.statusCode == 500) {
      loading(false);
      showSnackbar(SnackbarMessage.error, 'Something Went Wrong!');
    } else {
      loading(false);
      showSnackbar(SnackbarMessage.error, 'Unknown Error Occured');
    }
  }

  void pickImage(ImageSource imageSource) async {
    File? pickedFile = await MyFilePicker.pickImage(imageSource);
    Get.back();
    if (pickedFile != null) {
      imageFile(pickedFile);
    }
  }
}
