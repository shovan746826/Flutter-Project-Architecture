import 'package:mvvm_project/global_classes/global_variable.dart';
import 'package:mvvm_project/home/model/repository_model.dart';
import 'package:mvvm_project/home/repository/repository.dart';

class HomeViewModel{

  List<PictureListModel>? pictureList = [];

  Future<List<PictureListModel>> fetchPicture() async {
    final apiResult = await Repository().fetchPicture();
    if (apiResult!.isNotEmpty) {
      this.pictureList = apiResult.toList();
      logger.w("List Size", this.pictureList!.length);
    }else{
      logger.w("Empty Data", apiResult);
    }

    return pictureList!;
  }

}

