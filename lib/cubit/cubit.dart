import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qazonomozlar/cubit/state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  Future register() async {
    try {
      Response res = await Dio().post("");
    } catch (e) {}
  }
}
