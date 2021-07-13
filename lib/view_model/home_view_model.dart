import 'package:mvvm_project/global_classes/global_variable.dart';
import 'package:mvvm_project/model/repository_model.dart';
import 'package:mvvm_project/repository/repository.dart';

class HomeViewModel{

  List<PictureViewModel>? pictureList = [];

  Future<void> fetchPicture() async {
    final apiResult = await Repository().fetchPicture();
    if (apiResult!.isNotEmpty) {
      this.pictureList = apiResult.map((e) => PictureViewModel(e)).toList();
      logger.w("List Size", this.pictureList!.length);
    }else{
      logger.w("Empty Data", apiResult);
    }
  }

}

class PictureViewModel{
  final PictureListModel? pictureListModel;
  PictureViewModel(this.pictureListModel);
}

