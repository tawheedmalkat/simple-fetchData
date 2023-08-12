import 'dart:convert';

import 'package:fetchdata/photo.dart';
import 'package:flutter/material.dart'  ;
import 'package:http/http.dart'as http ;
class FetData{


  final String url ='https://jsonplaceholder.typicode.com/photos';
  Future<List<Photo>> getData()async{
    var response = await http.get(Uri.parse(url));
    List<Photo>myList=[];
    if(response.statusCode==200){
      final data=jsonDecode(response.body);
      for(Map<String,dynamic> d in data)
        {
          Photo photo = Photo.fromjson(d);

          myList.add(photo);
        }
      return myList;

    }

  else {
    throw Exception('${response.statusCode}');
  }
}}
