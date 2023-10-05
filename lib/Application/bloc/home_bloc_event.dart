part of 'home_bloc_bloc.dart';

@freezed
class HomeBlocEvent with _$HomeBlocEvent {
  const factory HomeBlocEvent.started() = _Started;
  const factory HomeBlocEvent.fourg() = _Fourg;
  const factory HomeBlocEvent.fiveg() = _Fiveg;
   const factory HomeBlocEvent.buttonBuild() = _ButtonBuild;
}