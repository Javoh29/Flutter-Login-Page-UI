import 'package:flutter/material.dart';
import 'package:flutterloginpage/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool rememberMe = false;

  Widget _buildEmail(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10,),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                hintText: 'Enter your Email',
                hintStyle: kHintTextStyle
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPassword(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10,),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60,
          child: TextField(
            obscureText: true,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                hintText: 'Enter your Password',
                hintStyle: kHintTextStyle
            ),
          ),
        )
      ],
    );
  }

  Widget _buildForgotPassword(){
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0),
        child: Text(
          'Forgot Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildRemember(){
    return Container(
      height: 20,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value){
                setState(() {
                  rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Remember me',
            style: kLabelStyle,
          )
        ],
      ),
    );
  }

  Widget _buildLoginBtn(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () => print('Login Button Pressed'),
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
              color: Color(0xFF527DAA,),
              letterSpacing: 1.5,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSansSemiBold'
          ),
        ),
      ),
    );
  }

  Widget _buildSingInWithText(){
    return Column(
      children: <Widget>[
        Text(
            '- OR -',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400
            )
        ),
        SizedBox(height: 20,),
        Text(
          'Sing in with',
          style: kLabelStyle,
        )
      ],
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(
                () => print('Login with Facebook'),
            AssetImage(
              'assets/facebook.jpg',
            ),
          ),
          _buildSocialBtn(
                () => print('Login with Google'),
            AssetImage(
              'assets/google.jpg',
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF73AEF5),
                  Color(0xFF61A4F1),
                  Color(0xFF478DE0),
                  Color(0xFF398AE5),
                ],
                stops: [0.1, 0.4, 0.7, 0.9]
              )
            ),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 120),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSansSemiBold',
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 30,),
                  _buildEmail(),
                  SizedBox(height: 30,),
                  _buildPassword(),
                  _buildForgotPassword(),
                  _buildRemember(),
                  _buildLoginBtn(),
                  _buildSingInWithText(),
                  SizedBox(height: 30,),
                  _buildSocialBtnRow(),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Don\'t have an Account? ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400
                            )
                        ),
                        TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            )
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
