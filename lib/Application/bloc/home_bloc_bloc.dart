import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';
part 'home_bloc_bloc.freezed.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBlocBloc() : super(HomeBlocState.initial()) {
    on<_Started>((event, emit) async{
        emit(HomeBlocState(resList: [], isLoading: true,buttonlist: []));
      final Response response=await Dio(BaseOptions()).get('https://run.mocky.io/v3/f9b2dfb8-cf6e-4c5f-bc69-ec8bb2b5a03a');
      try {
        if (response.statusCode==200 || response.statusCode==201) {
          final List XList=response.data['data'];
   
       final cc=XList.where((element) => element['parent_group']=='3G').toList();
       
          final List<Map<String,dynamic>> Ylist=List<Map<String,dynamic>>.from(XList);
          emit(HomeBlocState(resList: cc, isLoading: false,buttonlist: []));
           
        }
      } catch (e) {
        print(e);
      }

    });
    on<_Fourg>((event, emit) async{
       emit(HomeBlocState(resList: [], isLoading: true,buttonlist: []));
      final Response response=await Dio(BaseOptions()).get('https://run.mocky.io/v3/f9b2dfb8-cf6e-4c5f-bc69-ec8bb2b5a03a');
      try {
        if (response.statusCode==200 || response.statusCode==201) {
          final List XList=response.data['data'];
       final cc=XList.where((element) => element['parent_group']=='4G').toList();
      //  log(cc.toString());
          final List<Map<String,dynamic>> Ylist=List<Map<String,dynamic>>.from(XList);
          emit(HomeBlocState(resList: cc, isLoading: false,buttonlist: []));
        }
      } catch (e) {
        print(e);
      }
    },);
     on<_Fiveg>((event, emit) async{
       emit(HomeBlocState(resList: [], isLoading: true,buttonlist: []));
      final Response response=await Dio(BaseOptions()).get('https://run.mocky.io/v3/f9b2dfb8-cf6e-4c5f-bc69-ec8bb2b5a03a');
      try {
        if (response.statusCode==200 || response.statusCode==201) {
          final List XList=response.data['data'];
       final cc=XList.where((element) => element['parent_group']=='5G').toList();
      //  log(cc.toString());
          final List<Map<String,dynamic>> Ylist=List<Map<String,dynamic>>.from(XList);
          emit(HomeBlocState(resList: cc, isLoading: false,buttonlist: []));
        }
      } catch (e) {
        print(e);
      }
    },);

    on<_ButtonBuild>((event, emit) async{
       emit(HomeBlocState(resList: [], isLoading: true,buttonlist: []));
      final Response response=await Dio(BaseOptions()).get('https://run.mocky.io/v3/f9b2dfb8-cf6e-4c5f-bc69-ec8bb2b5a03a');
      try {
        if (response.statusCode==200 || response.statusCode==201) {
          final data=response.data['data'];
            Set<String> gSet=Set<String>();

            for (var x in data) {
              final gString=x['parent_group'];
              gSet.add(gString);
            }
       final List Glist=gSet.toList();
        
        // final cc=data.where((element) => element['parent_group']==Glist[]).toList()
      //  log(Glist.toString());
       emit(HomeBlocState(resList:data , isLoading: false,buttonlist: Glist));
        }
      } catch (e) {
        print(e);
      }
    },);
  }
}
