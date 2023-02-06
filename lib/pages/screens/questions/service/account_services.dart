import 'dart:convert';

import 'package:cocreator/global/environment.dart';
import 'package:cocreator/helpers/constants/error_handling.dart';
import 'package:cocreator/helpers/constants/utils.dart';
import 'package:cocreator/models/accounts.dart';
import 'package:cocreator/models/question.dart';
import 'package:cocreator/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class AccountServices {
  //Questionss accounts connect!!
  Future<List<AccountsConnect>> fetchAccounts({
    required BuildContext context,
  }) async {
    //final userProvider = Provider.of<UserProvider>(context, listen: false);

    List<AccountsConnect> accountsList = [];
    try {
      http.Response res = await http.get(
          Uri.parse('${Environment.apiUrl}/usuarios/onboardin/get-accounts'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'x-token': await AuthServices.getToken()
          });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            accountsList.add(
              AccountsConnect.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return accountsList;
  }

//Questionss!!
  Future<List<Question>> fetchQuestions({
    required BuildContext context,
  }) async {
    //final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Question> questionList = [];
    try {
      http.Response res = await http.get(
          Uri.parse(
              '${Environment.apiUrl}/usuarios/onboardin/get-questionPersonality'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'x-token': await AuthServices.getToken()
          });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            questionList.add(
              Question.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return questionList;
  }
}
