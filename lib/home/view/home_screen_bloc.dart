import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_project/home/bloc_pattern/home_bloc.dart';
import 'package:mvvm_project/home/bloc_pattern/home_event.dart';
import 'package:mvvm_project/home/bloc_pattern/home_state.dart';
import 'package:mvvm_project/home/repository/repository.dart';
import 'package:mvvm_project/home/view/state_widgets/home_state_widget.dart';

class HomeScreenBLoC extends StatefulWidget {
  @override
  _HomeScreenBLoCState createState() => _HomeScreenBLoCState();
}

class _HomeScreenBLoCState extends State<HomeScreenBLoC> {
  late HomeBLoC homeBLoC;

  @override
  void initState() {
    super.initState();

    homeBLoC = BlocProvider.of<HomeBLoC>(context);
    homeBLoC.add(FetchHomeEventData());
    
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          color: Colors.white,
          child: BlocBuilder<HomeBLoC, HomeState>(
            builder: (context, state) {
              if (state is HomeLoadingState) {
                return HomeStateWidgets().LoadingState();
              } else if (state is HomeLoadedState) {
                return HomeStateWidgets().LoadedState(state.listData);
              } else if (state is HomeErrorState) {
                return HomeStateWidgets().ErrorState(state.errorMessage);
              } else {
                return HomeStateWidgets().ErrorState("No State Found!!");
              }
            },
          )),
    );
  }
}
