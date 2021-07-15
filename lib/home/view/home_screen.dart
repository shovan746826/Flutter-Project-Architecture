import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mvvm_project/global_classes/global_variable.dart';
import 'package:mvvm_project/global_classes/global_widgets.dart';
import 'package:mvvm_project/home/model/repository_model.dart';
import 'package:mvvm_project/home/view/state_widgets/home_state_widget.dart';
import 'package:mvvm_project/home/view_model/home_view_model.dart';

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
          child: FutureBuilder<List<PictureListModel>>(
            future: homeViewModel.fetchPicture(),
            builder: (context, snapshot){
              if (snapshot.connectionState==ConnectionState.waiting) {
                return HomeStateWidgets().LoadingState();
              } else {
                if (snapshot.data!.length > 0) {
                  return HomeStateWidgets().LoadedState(snapshot.data!);
                } else {
                  return HomeStateWidgets().ErrorState("No Data Found!");
                }
              }
            },
          ),
        ),
      )
    );
  }
}
