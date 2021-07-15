import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mvvm_project/global_classes/global_widgets.dart';
import 'package:mvvm_project/home/model/repository_model.dart';

class HomeStateWidgets{

  Widget LoadingState(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget ErrorState(String message){
    return Center(
      child: Text(
        "$message",
        style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.red
        ),
      ),
    );
  }

  Widget LoadedState(List<PictureListModel> list){
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.all(8),
      crossAxisCount: 2,
      itemCount: list.length,
      itemBuilder: (context, index) => ImageCard(
        imageData: list[index].downloadUrl,
      ),
      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
    );
  }
}