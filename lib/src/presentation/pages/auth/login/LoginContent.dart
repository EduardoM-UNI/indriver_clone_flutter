import 'package:flutter/material.dart';
import 'package:indriver_clone_flutter/src/presentation/widgets/DefaultButton.dart';
import 'package:indriver_clone_flutter/src/presentation/widgets/DefaultTextField.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
           // color: Color.fromARGB(255, 24, 181, 254),
           gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
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
                _textLoginRotated(),
                SizedBox(height: 100),
                _textRegisterRotated(context),
                SizedBox(height: 250),
            ],
          ),
        ), 
        Container(
          margin: EdgeInsets.only(left: 60, bottom: 60), 
          decoration: BoxDecoration(
           // color: Color.fromARGB(255, 24, 181, 254),
           gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 14, 29, 166),
              Color.fromARGB(255, 30, 112, 227),
            ]
           ) ,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(35),bottomLeft: Radius.circular(35))
          ),
          child: Container( 
            margin: EdgeInsets.only(left: 25,right: 25), 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                _textWelcome('Welcome'),
                _textWelcome('Back.....'),
                _imageCar(),
                _textLogin(),
                  DefaultTextField(
                    text: 'email', 
                    icon: Icons.email_outlined),
                  DefaultTextField(
                    text: 'password', 
                    icon: Icons.lock_outline,
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    ),
                  Spacer(),
                  DefaultButton(
                    text: 'SING UP',
                    color: Colors.white,
                    textColor: Colors.blue,
                    ),
                  SizedBox(height: 20 ),
                  _separatorOr(),
                  SizedBox(height: 20 ),
                  _textDontHaveAccount(context),
                  SizedBox(height: 90)
              ],
            ),
          ),
        ),
      ],
    );
  }
    Widget _textDontHaveAccount(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'No tienes cuenta?',
          style: TextStyle(
            color: Colors.grey[100],
            fontSize: 17,
          ),
          ),
        SizedBox(width: 7),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'register');
          },
          child: Text(
            'Registrate',
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

  Widget _textLogin() {
    return Text(
      'Log in',
      style: TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.bold
      ),
      );
  }

  Widget _imageCar(){
      return  Container(
        alignment: Alignment.centerRight,
        child: Image.asset(
          'assets/img/car.png',
          width: 150,
          height: 150,
        ),
      );
  }

  Widget _textWelcome(text){
    return Text(
        text,
        style: TextStyle(
        fontSize: 30,
        color: Colors.white,
        fontWeight: FontWeight.bold
        ),);
  }

  Widget _textLoginRotated() {
    return RotatedBox(
        quarterTurns: 1,
        child: Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontSize: 27,
            fontWeight: FontWeight.bold
          ),
          ),
      );
  }
  Widget _textRegisterRotated(BuildContext context)  {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'register');
        },
        child: RotatedBox(
            quarterTurns: 1,
            child: Text(
              'Sing Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24),
                ),
          ),
      );

  }
}