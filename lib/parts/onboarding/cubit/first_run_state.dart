part of "../onboarding_part.dart";

sealed class FirstRunState extends Equatable {
  const FirstRunState();

  @override
  List<Object> get props => [];
}

final class FirstRunInitial extends FirstRunState {}

final class FirstRunLoaded extends FirstRunState {
  final bool isFirstRun;

  FirstRunLoaded({required this.isFirstRun});
}
