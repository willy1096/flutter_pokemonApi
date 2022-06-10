import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myapptest/src/services/home/home_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  HomeBloc() : super(HomeState()) {
    on<GetHomePockemones> ((event, emit) async {
       emit( await HomeService.getPokemones() );
    });
  }
  
  

}
