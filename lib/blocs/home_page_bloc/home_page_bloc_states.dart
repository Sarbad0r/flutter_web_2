import 'package:flutter_web_2/blocs/home_page_bloc/state/home_page_state.dart';

abstract class HomePageBlocStates {
  HomePageState homePageState;

  HomePageBlocStates({required this.homePageState});
}

class InitialHomePageState extends HomePageBlocStates {
  InitialHomePageState(homePageState) : super(homePageState: homePageState);
}

