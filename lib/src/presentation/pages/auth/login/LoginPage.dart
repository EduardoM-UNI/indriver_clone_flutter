import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:indriver_clone_flutter/src/domain/utils/Resource.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/LoginContent.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/LoginState.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color.fromARGB(255, 24, 181, 254),
        body: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              final response = state.response;
              if (response is ErrorData){
                print('Error Data: ${response.message}');
              }
              else if (response is Success){
                print('Succes Data: ${response.data}');
              }
            },
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                final respose = state.response;
                if (respose is Loading) {
                  return Stack(
                    children: [
                        LoginContent(state),
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  );
                }
                return LoginContent(state);
              },
            ),
    ));
  }
}
