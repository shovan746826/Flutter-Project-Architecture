import 'dart:convert';
import 'package:mvvm_project/api/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm_project/home/model/repository_model.dart';

class Repository{

  List<PictureListModel>? list = [];

  Future<dynamic> fetchPicture() async{
    try{
      http.Response response = await APIResponse.getServerResponse();
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List<dynamic>;
        list = json.map((e) => PictureListModel.fromJson(e)).toList();
        return list;
      }else{
        APIErrorResponse.getError(response);
        return response;
      }
    }catch(e){
      return e;
    }

  }
}