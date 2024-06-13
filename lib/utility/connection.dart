import 'package:com_ramabit_www/main.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class sendback {
  var time = DateTime.now();
  var url = 'https://ramabit.com/api/v1/';

  get(uri) async {
    print(headers);
    var response =
        await http.get(Uri.parse(url + uri + '?pphg=$time'), headers: headers);
    print(json.decode(utf8.decode((response).bodyBytes)));
    return json.decode(utf8.decode((response).bodyBytes));
  }

  post(uri, body) async {
    var response = await http.post(Uri.parse(url + uri + '?pphg=$time'),
        body: body, headers: headers);
    return json.decode(utf8.decode((response).bodyBytes));
  }

  put(uri, body) async {
    var response = await http.put(Uri.parse(url + uri + '?pphg=$time'),
        body: body, headers: headers);
    return json.decode(utf8.decode((response).bodyBytes));
  }

  delete(uri) async {
    var response = await http.delete(Uri.parse(url + uri + '?pphg=$time'),
        headers: headers);
    return json.decode(utf8.decode((response).bodyBytes));
  }
}
