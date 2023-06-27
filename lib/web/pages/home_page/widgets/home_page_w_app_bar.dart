import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_2/blocs/home_page_bloc/home_page_bloc_events.dart';
import 'package:flutter_web_2/blocs/home_page_bloc/home_page_bloc_states.dart';
import 'package:flutter_web_2/blocs/home_page_bloc/main_home_page_bloc.dart';
import 'package:flutter_web_2/reusable/global_widgets.dart';
import 'package:flutter_web_2/reusable/routes.dart';
import 'package:flutter_web_2/web/widgets/text_widget.dart';

class HomePageWAppBar extends StatelessWidget {
  const HomePageWAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainHomePageBloc, HomePageBlocStates>(
        builder: (context, state) {
      return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        MouseRegion(
          onEnter: (pointer) async =>
              await GlobalWidgets.showDropdownMenu(context, pointer),
          child: const Tooltip(
            message: "",
            child: TextWidget(
                text: "Your shopping cart",
                size: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        Tooltip(
            message: "Shooping Cart Page",
            child: IconButton(
                onPressed: () => context
                    .read<MainHomePageBloc>()
                    .add(ShowCartFromSideWebEvent()),
                icon: const Icon(CupertinoIcons.shopping_cart,
                    color: Colors.black)))
      ]);
    });
  }
}
