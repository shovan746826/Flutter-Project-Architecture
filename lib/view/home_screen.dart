import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mvvm_project/global_classes/global_widgets.dart';
import 'package:mvvm_project/view_model/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    HomeViewModel homeViewModel = new HomeViewModel();

    return SafeArea(
      child : Scaffold(
        body: Container(
          color: Colors.white,
          child: FutureBuilder(
            future: homeViewModel.fetchPicture(),
            builder: (context, snapshot){
              if (snapshot.connectionState==ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (homeViewModel.pictureList!.length > 0) {
                  return StaggeredGridView.countBuilder(
                    padding: EdgeInsets.all(8),
                    crossAxisCount: 2,
                    itemCount: homeViewModel.pictureList!.length,
                    itemBuilder: (context, index) => ImageCard(
                      imageData: homeViewModel.pictureList![index].pictureListModel!.downloadUrl,
                    ),
                    staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                  );
                } else {
                  return Center(
                    child: Text(
                      "No Data Found",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.red
                      ),
                    ),
                  );
                }
              }
            },
          ),
        ),
      )
    );
  }
}
