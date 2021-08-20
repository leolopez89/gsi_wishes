part of 'app_bloc.dart';

@immutable
class AppState {
  final List<Wish> wishes;
  final String user;

  AppState({List<Wish>? wishes, String? user})
      : this.wishes = wishes ?? [],
        this.user = user ?? "";

  AppState copyWith({Wish? wish, String? user}) => AppState(
        wishes: wish != null ? [...this.wishes, wish] : this.wishes,
        user: user ?? this.user,
      );

  AppState updateWish(Wish wish) => AppState(
        user: this.user,
        wishes: [
          wish,
          ...this.wishes.where((element) => element.id != wish.id),
        ],
      );
}
