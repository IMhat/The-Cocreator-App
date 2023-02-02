import 'dart:convert';

import 'package:http/http.dart' as http;

String apiKey = "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";
//String apiKey = "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";

class ApiServices {
  static String baseUrl = "https://api.openai.com/v1/completions";

  static Map<String, String> header = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept-Language': 'es-419',
    'Authorization': 'Bearer $apiKey',
  };

  static sendMessage(String? message) async {
    var res = await http.post(
      Uri.parse(baseUrl),
      headers: header,
      body: jsonEncode({
        "model": "text-davinci-003",
        "prompt": '$message',
        "temperature": 0,
        "max_tokens": 100,
        "top_p": 1,
        "frequency_penalty": 0.0,
        "presence_penalty": 0.0,
        "stop": [" Human:", " AI:"],
      }),
    );

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body.toString()

          //data = utf8.decode(resp.bodyBytes)

          );

      var msg = data['choices'][0]['text'];
      return msg;
    } else {
      print("Failed to fetch data");
    }
  }
}
