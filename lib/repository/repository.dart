import 'dart:convert';
import 'package:mvvm_project/api/api_response.dart';
import 'package:mvvm_project/model/repository_model.dart';
import 'package:http/http.dart' as http;

class Repository{

  List<PictureListModel>? list = [];

  Future<List<PictureListModel>?> fetchPicture() async{
     http.Response response = await APIResponse.getServerResponse();
       if (response.statusCode == 200) {
         final json = jsonDecode(response.body) as List<dynamic>;
         list = json.map((e) => PictureListModel.fromJson(e)).toList();
       }else{
         APIErrorResponse.getError(response);
       }

     return list;
  }
}