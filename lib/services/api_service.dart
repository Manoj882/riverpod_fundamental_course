import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:riverpod_course/models/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService{
  String endpoint = 'https://reqres.in/api/users?page-1';

  Future<List<UserModel>> getUser() async{
    final response = await http.get(Uri.parse(endpoint));

    if(response.statusCode == 200){
      final List result = json.decode(response.body)['data'] ;
      return result.map((user) => UserModel.fromJson(user)).toList();
      
    } 
     else {
      throw Exception(response.reasonPhrase);
    }

  }
}