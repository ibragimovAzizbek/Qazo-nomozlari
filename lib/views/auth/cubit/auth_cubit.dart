import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qazonomozlar/services/getStorageService/get_storage_service.dart';
import 'package:qazonomozlar/views/auth/state/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  bool isHidden = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future registerUser() async {
    try {
      emit(AuthLoading());
      Response res = await Dio().post(
        "http://192.168.1.161:1337/api/auth/local/register",
        data: {
          "username": nameController.text,
          "email": emailController.text,
          "password": passwordController.text,
        },
      );
      if (res.statusCode == HttpStatus.ok) {
        await GetStorageService.inherentce.box.write("token", res.data['jwt']);
        print("TOKEN: ${GetStorageService.inherentce.box.read('token')}");
        emit(AuthComplate());
      } else {
        emit(AuthError(msg: "Bog'lanishda xato bor, qayta urining "));
      }
    } catch (e) {
      emit(AuthError(msg: 'Another Error ${e.toString()}'));
    }
  }

  changePasswrodHidden() {
    isHidden = !isHidden;
    emit(AuthInitial());
  }

  // bool isDisabled = true;

  // changeSendButton(status) {
  //   isDisabled = status;
  //   emit(AuthComplate());
  // }
}
