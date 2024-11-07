import 'package:flutter/material.dart';
import 'package:indriver_clone_flutter/src/presentation/widgets/DefaultButton.dart';
import 'package:indriver_clone_flutter/src/presentation/widgets/DefaultTextField.dart';

class Registercontent extends StatelessWidget {
  const Registercontent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
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
              colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 154, 154, 154),
              ])
          ),
          child: Column(
            children: [
              _imageBanner(),
              DefaultTextField(
                text: 'Name', 
                icon: Icons.person_outline,
                margin: EdgeInsets.only(left: 40, right: 40, top: 50),
                ),
                DefaultTextField(
                text: 'Surname', 
                icon: Icons.person_2_outlined,
                margin: EdgeInsets.only(left: 40, right: 40, top: 15),
                ),
                DefaultTextField(
                text: 'Email', 
                icon: Icons.email_outlined,
                margin: EdgeInsets.only(left: 40, right: 40, top: 15),
                ),
                DefaultTextField(
                text: 'Phone', 
                icon: Icons.phone_outlined,
                margin: EdgeInsets.only(left: 40, right: 40, top: 15),
                ),
                DefaultTextField(
                text: 'Password', 
                icon: Icons.lock_outlined,
                margin: EdgeInsets.only(left: 40, right: 40, top: 15),
                ),
                DefaultTextField(
                text: 'Confirm Password', 
                icon: Icons.lock_outlined,
                margin: EdgeInsets.only(left: 40, right: 40, top: 15),
                ),
                DefaultButton(
                  text: 'Create User',
                  margin: EdgeInsets.only(top: 30, left: 60, right: 60),
                  ),
                  SizedBox(height: 25),
                  _separatorOr(),
                  _textIAreadyHaveAccount(context)
            ],
          ),
        )
      ],
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
            Navigator.pushNamed(context, 'login');
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
          Navigator.pushNamed(context, 'login');
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