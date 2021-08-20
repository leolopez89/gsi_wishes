import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gsi_wishes/models/wish.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState());

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is LoadApp) {
      // List<Wish> wishes = loadTestData();
      // yield (AppState(wishes: wishes));
    } else if (event is AddWish) {
      yield state.copyWith(wish: event.wish);
    } else if (event is ChangeUser) {
      yield state.copyWith(user: event.user);
    } else if (event is UpdateWishState) {
      yield state.updateWish(event.wish);
    }
  }
}
