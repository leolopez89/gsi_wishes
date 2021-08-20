part of 'app_bloc.dart';

@immutable
abstract class AppEvent {}

/// App Load event
class LoadApp extends AppEvent {}

/// User selection event
class ChangeUser extends AppEvent {
  final String user;
  ChangeUser(this.user);
}

/// To add new [Wish]
class AddWish extends AppEvent {
  final Wish wish;
  AddWish(this.wish);
}

/// To update new [Wish]
class UpdateWishState extends AppEvent {
  final Wish wish;
  UpdateWishState(this.wish);
}
