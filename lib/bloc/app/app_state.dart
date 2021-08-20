part of 'app_bloc.dart';

@immutable
class AppState {
  /// The list of wishes
  final List<Wish> wishes;
  /// Selected user
  final String user;

  AppState({List<Wish>? wishes, String? user})
      : this.wishes = wishes ?? [],
        this.user = user ?? "";

  /// Update this with a new [Wish] or user
  AppState copyWith({Wish? wish, String? user}) => AppState(
        wishes: wish != null ? [...this.wishes, wish] : this.wishes,
        user: user ?? this.user,
      );

  /// Uptade a [Wish] in the state
  AppState updateWish(Wish wish) => AppState(
        user: this.user,
        wishes: [
          wish,
          ...this.wishes.where((element) => element.id != wish.id),
        ],
      );
}
