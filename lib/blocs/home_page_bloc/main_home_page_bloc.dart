import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_2/blocs/home_page_bloc/home_page_bloc_events.dart';
import 'package:flutter_web_2/blocs/home_page_bloc/home_page_bloc_states.dart';
import 'package:flutter_web_2/blocs/home_page_bloc/state/home_page_state.dart';

class MainHomePageBloc extends Bloc<HomePageBlocEvents, HomePageBlocStates> {
  MainHomePageBloc() : super(InitialHomePageState(HomePageState())) {
    //
    on<ShowHomePageBannerEvent>((event, emit) {
      var currentState = state.homePageState;

      emit(ShowBannerHomePageState(currentState));
    });
    //
    on<DismissHomePageBannerEvent>((event, emit) {
      var currentState = state.homePageState;
      emit(InitialHomePageState(currentState));
    });
  }
}
