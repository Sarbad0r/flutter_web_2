import 'package:flutter/cupertino.dart';
import 'package:flutter_web_2/blocs/home_page_bloc/home_page_bloc_states.dart';

double childAspectRatioWeb(
    {required BuildContext context, required HomePageBlocStates state}) {
  double mediaQ = MediaQuery.of(context).size.width;

  if (state.homePageState.showCartFromSideWeb) {
    return 0.9;
  } else {
    return 1.2;
  }
}

double sideCartWeb({required BuildContext context}) {
  double mediaQ = MediaQuery.of(context).size.width;

  if (mediaQ >= 1100 && mediaQ < 1250) {
    return 300;
  } else {
    return 350;
  }
}

double homePagePaddingWeb(
    {required BuildContext context, required HomePageBlocStates state}) {
  double mediaQ = MediaQuery.of(context).size.width;

  if (state.homePageState.showCartFromSideWeb) {
    return 20;
  } else {
    if (mediaQ >= 1100 && mediaQ < 1250) {
      return 20;
    } else {
      return 200;
    }
  }
}

double imageSizeWeb({required BuildContext context}) {
  double mediaQ = MediaQuery.of(context).size.width;

  if (mediaQ > 1432) {
    return 150;
  } else if (mediaQ > 1400 && mediaQ <= 1432) {
    return 140;
  } else if (mediaQ > 1350 && mediaQ <= 1400) {
    return 130;
  } else if (mediaQ > 1300 && mediaQ <= 1350) {
    return 120;
  } else if (mediaQ > 1250 && mediaQ <= 1300) {
    return 110;
  } else {
    return 100;
  }
}
