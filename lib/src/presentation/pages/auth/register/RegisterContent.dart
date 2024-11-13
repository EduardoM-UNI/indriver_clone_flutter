import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/register/bloc/RegisterState.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:indriver_clone_flutter/src/presentation/widgets/DefaultButton.dart';
import 'package:indriver_clone_flutter/src/presentation/widgets/DefaultTextFieldOutlined.dart';

class Registercontent extends StatelessWidget {

  Registerstate state;

   Registercontent(this.state);
 
  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
             gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: const [
                Color.fromARGB(255, 12, 38, 145),
                Color.fromARGB(255, 34, 156, 249),
              ]
             ),
            ),
            padding: EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  _textLoginRotated(context),
                  SizedBox(height: 100),
                  _textRegisterRotated(),
                  SizedBox(height: 250),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 60, bottom: 35),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                bottomLeft: Radius.circular(35)
              ),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: const [
                Color.fromARGB(255, 14, 29, 166),
                Color.fromARGB(255, 30, 112, 227),
                ])
            ),
            child: Stack(
              children: [
                _imageBackground(context),
                SingleChildScrollView(
                  child: Column(
                      children: [
                        _imageBanner(),
                          DefaultTextFieldOutLined(
                          text: 'Name', 
                          icon: Icons.person_outline,
                          margin: EdgeInsets.only(left: 40, right: 40, top: 50),
                          onChanged: (text) {
                            context.read<RegisterBloc>().add(NameChanged(name: BlocFormitem(value: text)));
                          },
                          validator: (value){
                            return state.name.error;
                          }, 
                          ),
                          DefaultTextFieldOutLined(
                          text: 'Surname', 
                          icon: Icons.person_2_outlined,
                          margin: EdgeInsets.only(left: 40, right: 40, top: 15),
                          onChanged: (text) {
                            context.read<RegisterBloc>().add(LastNameChanged(lastname: BlocFormitem(value: text)));
                          },
                          validator: (value){
                            return state.lastname.error;
                          }, 
                          ),
                          DefaultTextFieldOutLined(
                          text: 'Email', 
                          icon: Icons.email_outlined,
                          margin: EdgeInsets.only(left: 40, right: 40, top: 15),
                          onChanged: (text) {
                            context.read<RegisterBloc>().add(EmailChanged(email: BlocFormitem(value: text)));
                          },
                          validator: (value){
                            return state.email.error;
                          }, 
                          ),
                          DefaultTextFieldOutLined(
                          text: 'Phone', 
                          icon: Icons.phone_outlined,
                          margin: EdgeInsets.only(left: 40, right: 40, top: 15),
                          onChanged: (text) {
                            context.read<RegisterBloc>().add(PhoneChanged(phone: BlocFormitem(value: text)));
                          },
                          validator: (value){
                            return state.phone.error;
                          }, 
                          ),
                          DefaultTextFieldOutLined(
                          text: 'Password', 
                          icon: Icons.lock_outlined,
                          margin: EdgeInsets.only(left: 40, right: 40, top: 15),
                          onChanged: (text) {
                            context.read<RegisterBloc>().add(PasswordChanged(password: BlocFormitem(value: text)));
                          },
                          validator: (value){
                            return state.password.error;
                          }, 
                          ),
                          DefaultTextFieldOutLined(
                          text: 'Confirm Password', 
                          icon: Icons.lock_outlined,
                          margin: EdgeInsets.only(left: 40, right: 40, top: 15),
                          onChanged: (text) {
                            context.read<RegisterBloc>().add(ConfirmPasswordChanged(confirmPassword: BlocFormitem(value: text)));
                          },
                          validator: (value){
                            return state.confirmPassword.error;
                          }, 
                          ),
                          DefaultButton(
                            onPressed: (){
                            if (state.formKey!.currentState!.validate()){
                              context.read<RegisterBloc>().add(FormSubmit());
                              context.read<RegisterBloc>().add(FormReset());
                            }
                              else{
                                print('The form is no valid');
                              }
                          },
                            text: 'Create User',
                            margin: EdgeInsets.only(top: 30, left: 60, right: 60),
                            ),
                            SizedBox(height: 25),
                            _separatorOr(),
                            _textIAreadyHaveAccount(context)
                      ],
                    ),
                ),
              ],
            ),
          ), 
        ],
      ),
    );
  }
Widget _imageBackground(BuildContext context) {
      return Container(
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.only(bottom: 50),
        child: Image.asset(
          'assets/img/destination.png',
          width: MediaQuery.of(context).size.width *0.6,
          height: MediaQuery.of(context).size.height *0.4,
          opacity: AlwaysStoppedAnimation(0.2),
          ),
      );
}

 Widget _textIAreadyHaveAccount(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Ya tienes cuenta?',
          style: TextStyle(
            color: Colors.grey[100],
            fontSize: 17,
          ),
          ),
        SizedBox(width: 7),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            'Log in',
            style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold
            ),
            ),
        ),
      ],
    );
  }

  Widget _separatorOr(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 30,
          height: 1,
          color: Colors.white,
          margin: EdgeInsets.only(right: 5),
        ),
        Text(
        'O',
        style: TextStyle(
        color: Colors.white,
        fontSize: 17,
        fontWeight: FontWeight.bold
        ),
        ),
        Container(
          width: 30,
          height: 1,
          color: Colors.white,
          margin: EdgeInsets.only(left: 5),
        ),
      ],
  );
  }

    Widget _imageBanner(){
      return  Container(
        margin: EdgeInsets.only(top: 60),
        alignment: Alignment.center,
        child: Image.asset(
          'assets/img/delivery.png',
          width: 180,
          height: 180,
        ),
      );
  }

  Widget _textLoginRotated(BuildContext context) {
    return GestureDetector(
      onTap: () {
          Navigator.pop(context);
        },
      child: RotatedBox(
          quarterTurns: 1,
          child: Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
            ),
        ),
    );
  }
  Widget _textRegisterRotated()  {
      return RotatedBox(
            quarterTurns: 1,
            child: Text(
              'Sing Up',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 27),
                ),
          );
  }
}