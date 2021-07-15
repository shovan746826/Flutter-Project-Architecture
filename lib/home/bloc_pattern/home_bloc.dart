import 'package:bloc/bloc.dart';
import 'package:mvvm_project/global_classes/global_variable.dart';
import 'package:mvvm_project/home/bloc_pattern/home_event.dart';
import 'package:mvvm_project/home/bloc_pattern/home_state.dart';
import 'package:mvvm_project/home/model/repository_model.dart';
import 'package:mvvm_project/home/repository/repository.dart';
import 'package:http/http.dart' as http;

class HomeBLoC extends Bloc<HomeEvent, HomeState>{

  Repository repository;
  HomeBLoC({required this.repository}) : super(HomeInitialState());

  @override


  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async*{
    yield HomeLoadingState();
    try{
      final apiResult = await repository.fetchPicture();
      logger.i("type", apiResult.runtimeType);
      if (apiResult is http.Response) {
        yield HomeErrorState(errorMessage: apiResult.body);
      }else if(apiResult is List<PictureListModel> && apiResult.isNotEmpty) {
        var list = apiResult.toList();
        yield HomeLoadedState(listData: list);
      }else {
        yield HomeErrorState(errorMessage: "No Data Found!");
      }
    }catch(e){
      yield HomeErrorState(errorMessage: e.toString());
    }
  }


}