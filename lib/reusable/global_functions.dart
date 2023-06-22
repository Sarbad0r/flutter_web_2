import 'package:flutter/cupertino.dart';

double childAspectRatio({required BuildContext context}) {
  double mediaQ = MediaQuery.of(context).size.width;

  if (mediaQ > 1432) {
    return 1.4;
  } else if (mediaQ > 1400 && mediaQ <= 1432) {
    return 1.3;
  } else if (mediaQ > 1350 && mediaQ <= 1400) {
    return 1.2;
  } else if (mediaQ > 1300 && mediaQ <= 1350) {
    return 1.1;
  } else if (mediaQ > 1250 && mediaQ <= 1300) {
    return 1;
  }else{
    return 0.9;
  }
}
