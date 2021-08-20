part of 'app_bloc.dart';

@immutable
abstract class AppEvent {}

class LoadApp extends AppEvent {}

class ChangeUser extends AppEvent {
  final String user;
  ChangeUser(this.user);
}

class AddWish extends AppEvent {
  final Wish wish;
  AddWish(this.wish);
}

class UpdateWish extends AppEvent {
  final Wish wish;
  UpdateWish(this.wish);
}
