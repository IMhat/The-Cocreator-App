import 'dart:convert';

import 'package:another_quickbooks/another_quickbooks.dart';
import 'package:another_quickbooks/quickbook_models.dart';
import 'package:cocreator/global/environment.dart';
import 'package:cocreator/helpers/constants/error_handling.dart';
import 'package:cocreator/helpers/constants/utils.dart';
import 'package:cocreator/pages/screens/home/services/quickbooks/models/balance.dart';
import 'package:cocreator/pages/screens/home/services/quickbooks/service/auth_quickbooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cocreator/services/auth_service.dart';

import 'package:http/http.dart' as http;

import '../models/cashFlow.dart';

class QuickbookService with ChangeNotifier {
  //CashFlow accounts connect!!

  String baseUrl = 'https://sandbox-quickbooks.api.intuit.com';
  String url =
      'https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365271102750/reports/CashFlow?minorversion=65';
  String companyId = '4620816365271102750';
  String minorversion = '65';

  Future<List<Balance>> getBalance({
    required BuildContext context,
  }) async {
    //final userProvider = Provider.of<UserProvider>(context, listen: false);

    List<Balance> balance = [];
    try {
      http.Response res = await http.get(
          Uri.parse('${Environment.apiUrl}/usuarios/quickbooks/balance'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'x-token': await AuthServices.getToken()
          });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            balance.add(
              Balance.fromJson(
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
    return balance;
  }

  Future<Balance> getBalance2() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();

    // var id = prefs.getInt('id');
    // var token = prefs.getString('token');

    var url = '${Environment.apiUrl}/usuarios/quickbooks/balance';
    var headers = {
      'Content-Type': 'application/json',
      'x-token': await AuthServices.getToken()
    };

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      Balance balance = Balance.fromJson(data);

      return balance;
    } else {
      print(response.body);
      throw Exception('Failed');
    }
  }

  Future<List<CashFlow>> fetchCashFlow({
    required BuildContext context,
  }) async {
    // final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<CashFlow> cashFlowList = [];

    try {
      http.Response res = await http.get(Uri.parse(url), headers: {
        //'Content-Type': 'application/json; charset=UTF-8',
        "Authorization":
            'Bearer${await AuthQuickbookService.getQuickbooksToken()}'
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          // for (int i = 0; i < jsonDecode(res.body).length; i++) {
          //   cashFlowList.add(
          //     CashFlow.fromJson(
          //       jsonDecode(res.body)[i],
          //     ),
          //   );
          // }

          print(jsonDecode(res.body)['Rows']['Row']);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return cashFlowList;
  }

  Future<List<CashFlow>> test({
    required BuildContext context,
  }) async {
// This Function will check Internet is available or not.
// Utils.checkConnection().then((connectionResult) {
    List<CashFlow> cashFlowList = [];

    http.get(
        Uri.parse(
            '$baseUrl/v3/company/$companyId/reports/CashFlow?minorversion=$minorversion'),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          "Bearer":
              "eyJlbmMiOiJBMTI4Q0JDLUhTMjU2IiwiYWxnIjoiZGlyIn0..5vq5EGtmX5KmVmxilSngVg.Fis8_RW_6AwXZ8PRgENIlDYa98Pnk5hYMP--fvteS0sExOMx1GSDouz4YjG7gj__7wxKRKe6ABk7kZCjaKafZ6CnMQ0MaSsIDBp-txWpRGZuvwDjGUhzetNzu5NwVgoQcMhzGIBIVey7haFRA-5TZTlQEqNu3-x6NI0EB_hvqMhId3tt2UEG8_OEfvuloyGiR3NIh4DR_P8qYarWCMq_G5AgP0E6Se5blHgMfCCH0aIw6UQK1gVNE7CtVmZ3HuT5pnQuDJqstE2d7DBQfPEk7zjnMG4NQr-_Eihmzpa4_ZuzN44n7uPEbFB63kJmH98PSscBWBvrG_mTdDZb0tCBNrPnUv5_ZEgO1Wk0K7lmJr_S2iyLnBHiVoV_h0WvymJ7ZfaB59RaKyU16bTyN8C1Kw_hm-W1CrNlNLmSEZ2gPH9O9Bj0nCz-jV8LfHca_GjD1PK08pKsMaA-U0wOqZikHNVVEbOFrJuns6ykZR28B6EKB0B4gpZCDujkNZk5J3Q9TT9JyVwm03vMmcgVtQVr_jc-mWVnL625ow7YU0ZuwN7yHfkUvJzBXtgltW1FhFTok1C8YUbwoAMfXe-WNUzaEsz5FkKf6mFkkNHHiKPEpmLdi4fqJXiZl49SLYKB04nByZujv2Cn634aafwdpFxfQfXkSpGXF-lkwdq9VQtfMBqHlWee8TKEOChOfZGbZ5MaUSHBnUPLP1hdWokg0oxixG1Jh2a_XXLrQyyVZ_L0U2yZtRVSy7lk2iF8XUcwyVU9wWhtcmSPs8Mug3mO_rwrGVkZHc_6t9do7mcQKxzpGjccbUauQIPFNc5cfYrp7ynj466_XUjXlUosaLE-nowSE6zGVE-CHUXoApKIdqd6OZvGSgsgFZc_1pqMtYoNs3mP3SXH6DGtwXYKLd6Er2YzKA.Z7B1W5IqExL_x061OFd0lg"
        }).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        Exception("Error while fetching data");
      } else {
        //Parsing json response to particular Object.
        print(json.decode(res));

        // Unable to cast json here...
        // final parsed = json.decode(res).cast<Map<String, dynamic>>();

        // parsed.map<CashFlow>((json) => CashFlow.fromJson(json));

        // CashFlow cashFlowResponse =
        //     parsed.map<CashFlow>((json) => CashFlow.fromJson(json));

        final Map parsed = json.decode(res);

        //final signUp = CashFlow.fromJson(parsed);

        final List parsedList = json.decode(res);

        cashFlowList = parsedList.map((val) => CashFlow.fromJson(val)).toList();

        return cashFlowList;
      }
    });
    return cashFlowList;
  }
}
