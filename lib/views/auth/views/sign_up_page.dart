import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qazonomozlar/core/constants/colors/color_const.dart';
import 'package:qazonomozlar/core/widgets/auth/sign_up_view.dart';
import 'package:qazonomozlar/views/auth/cubit/auth_cubit.dart';
import 'package:qazonomozlar/views/auth/state/auth_state.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return AuthCubit();
      },
      child: Scaffold(
        backgroundColor: ColorConst.background,
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthComplate) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (route) => false);
            }
          },
          builder: (context, state) {
            if (state is AuthInitial || state is AuthComplate) {
              return SignUpBody();
            } else if (state is AuthLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is AuthError) {
              return mySnackBar(context, "Auth error ${state.msg}");
            } else {
              return mySnackBar(context, "Auth another error");
            }
          },
        ),
      ),
    );
  }

  mySnackBar(context, String data) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(data),
      backgroundColor: ColorConst.red,
    ));
  }
}
