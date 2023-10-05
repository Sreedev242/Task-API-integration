part of 'home_bloc_bloc.dart';

@freezed
class HomeBlocState with _$HomeBlocState {
  const factory HomeBlocState({required List resList,required bool isLoading,required List buttonlist}) = _Initial;
  factory HomeBlocState.initial()=>HomeBlocState(resList: [],isLoading: false,buttonlist: []);
}
