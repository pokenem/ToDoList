import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tdlist/token.dart';

class NetworkManager {
  static const _url = "https://beta.mrdekk.ru/todobackend/list";

  NetworkManager();

  int _revision = 0;

  Future<List<dynamic>> getData() async {
    List<dynamic> data = [];
    try {
      final response = await http.get(
        Uri.parse(_url),
        headers: {"Authorization": "Bearer $token"},
      );
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
       // print(jsonResponse);
          data = jsonResponse['list'];
          _revision = jsonResponse['revision'];
      } else {
        print(response.statusCode);
      }
    }
    catch(e)
    {
      throw e;
    }
      return data;


  }
  Future<dynamic> postData(String body) async {
    try {
      final response = await http.post(
        Uri.parse(_url),
        headers: {"Authorization": "Bearer $token", "X-Last-Known-Revision" : "$_revision"},
        body: body,
      );
      _revision = jsonDecode(response.body)['revision'];
      if (response.statusCode == 200) {

      } else {
      }
    }
    catch(e)
    {
      throw e;
    }
  }

  Future<dynamic> putData(String body, String id) async {
    try {
      final response = await http.put(
        Uri.parse("$_url/$id"),
        headers: {"Authorization": "Bearer $token", "X-Last-Known-Revision": "$_revision"},
        body: body,
      );
      _revision = jsonDecode(response.body)['revision'];

      if (response.statusCode == 200) {
      } else {
        print(response.statusCode);
      }
    }
    catch (e) {
      throw e;
    }
  }
    Future<dynamic> deleteData(String id) async {
      try {
        final response = await http.delete(
          Uri.parse("$_url/$id"),
          headers: {"Authorization": "Bearer $token", "X-Last-Known-Revision" : "$_revision"},
        );
        _revision = jsonDecode(response.body)["revision"];
        if (response.statusCode == 200) {

        } else {
        }
      }
      catch(e)
      {
        throw e;
      }
    }

  Future<dynamic> patchData(String body) async {
    try {
      final response = await http.patch(
        Uri.parse(_url),
        headers: {"Authorization": "Bearer $token", "X-Last-Known-Revision" : "$_revision"},
        body: body,
      );
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        _revision = jsonResponse['revision'];
      } else {
        print(response.statusCode);
      }
    }
    catch(e)
    {
      throw e;
    }


  }



}