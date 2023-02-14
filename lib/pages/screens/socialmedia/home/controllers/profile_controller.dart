import 'dart:convert';

import 'package:cocreator/pages/screens/socialmedia/enums/snackbar_message.dart';
import 'package:cocreator/pages/screens/socialmedia/home/components/add_profile_data.dart';
import 'package:cocreator/pages/screens/socialmedia/home/components/main_profile.dart';
import 'package:cocreator/pages/screens/socialmedia/models/profile_model.dart';
import 'package:cocreator/pages/screens/socialmedia/services/http_service.dart';
import 'package:cocreator/pages/screens/socialmedia/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  Rx<Widget> page = Rx<Widget>(Center(child: circularProgress()));
  Rx<ProfileModel?> profileModel = Rx<ProfileModel?>(null);

  final HttpService httpService = HttpService();

  void fetchData() async {
    try {
      http.Response response = await httpService.get('/profile/getData');
      var data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        profileModel(ProfileModel.fromJson(data['data']));
      } else if (response.statusCode == 500) {
        showSnackbar(SnackbarMessage.error, data['msg']);
      } else {
        showSnackbar(SnackbarMessage.error, 'Unknown Error Occured');
      }
    } catch (e) {
      showSnackbar(SnackbarMessage.error, e.toString());
    }
  }

  void checkProfile() async {
    try {
      http.Response response = await httpService.get('/profile/checkprofile');
      var data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        bool hasProfile = data['status'];
        if (hasProfile) {
          page(const MainProfile());
        } else {
          page(const AddProfileData());
        }
      } else if (response.statusCode == 500) {
        showSnackbar(SnackbarMessage.error, data['msg']);
      } else {
        showSnackbar(SnackbarMessage.error, 'Unknown Error Occured');
      }
    } catch (e) {
      showSnackbar(SnackbarMessage.error, e.toString());
    }
  }
}
