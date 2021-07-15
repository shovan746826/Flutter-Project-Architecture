import 'package:equatable/equatable.dart';
import 'package:mvvm_project/home/model/repository_model.dart';
import 'package:meta/meta.dart';

abstract class HomeState extends Equatable{}

class HomeInitialState extends HomeState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeLoadingState extends HomeState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeLoadedState extends HomeState{
  List<PictureListModel> listData;
  HomeLoadedState({required this.listData});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class HomeErrorState extends HomeState{
  String errorMessage;
  HomeErrorState({required this.errorMessage});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}