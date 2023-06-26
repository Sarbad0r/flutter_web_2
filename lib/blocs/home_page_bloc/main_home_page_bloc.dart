import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_2/blocs/home_page_bloc/home_page_bloc_events.dart';
import 'package:flutter_web_2/blocs/home_page_bloc/home_page_bloc_states.dart';
import 'package:flutter_web_2/blocs/home_page_bloc/state/home_page_state.dart';
import 'package:flutter_web_2/models/cart_item.dart';

class MainHomePageBloc extends Bloc<HomePageBlocEvents, HomePageBlocStates> {
  MainHomePageBloc() : super(InitialHomePageState(HomePageState())) {
    //
    on<ShowHomePageBannerEvent>((event, emit) {
      var currentState = state.homePageState;

      currentState.showBanner = true;

      emit(InitialHomePageState(currentState));
    });
    //
    on<DismissHomePageBannerEvent>((event, emit) {
      var currentState = state.homePageState;

      currentState.showBanner = false;

      emit(InitialHomePageState(currentState));
    });

    //
    on<ShowCartFromSideWebEvent>((event, emit) {
      var currentState = state.homePageState;

      currentState.showCartFromSideWeb = !currentState.showCartFromSideWeb;

      emit(InitialHomePageState(currentState));
    });

    //
    on<AddProductToCart>((event, emit) {
      var currentState = state.homePageState;

      var checkProdInCart = currentState.cartItems
          .where((el) => el.productModel?.id == event.productModel?.id)
          .firstOrNull;

      if (checkProdInCart == null) {
        CartItem cartItem = CartItem(productModel: event.productModel, qty: 1);
        currentState.cartItems.add(cartItem);
      } else {
        checkProdInCart.qty = (checkProdInCart.qty ?? 0) + 1;
        currentState.cartItems[currentState.cartItems.indexWhere(
                (el) => el.productModel?.id == event.productModel?.id)] =
            checkProdInCart;
      }
      if (currentState.cartItems.isNotEmpty &&
          currentState.showCartFromSideWeb != true) {
        currentState.showCartFromSideWeb = true;
      }
      emit(InitialHomePageState(currentState));
    });

    //
    on<DecreaseQtyEvent>((event, emit) {
      var currentState = state.homePageState;

      var checkItem = currentState.cartItems
          .where((el) => el.productModel?.id == event.productModel?.id)
          .firstOrNull;

      if (checkItem != null) {
        if ((checkItem.qty ?? 0.0) > 1) {
          checkItem.qty = (checkItem.qty ?? 0.0) - 1;
          currentState.cartItems[currentState.cartItems.indexWhere(
                  (el) => el.productModel?.id == event.productModel?.id)] =
              checkItem;
        } else {
          currentState.cartItems.removeWhere(
              (el) => el.productModel?.id == event.productModel?.id);
        }
      } else {
        debugPrint("Error product");
      }
      emit(InitialHomePageState(currentState));
    });
  }
}
