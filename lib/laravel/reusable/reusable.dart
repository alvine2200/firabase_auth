import 'package:firebase_auth/laravel/screens/login.dart';
import 'package:firebase_auth/laravel/screens/register.dart';
import 'package:flutter/material.dart';

ClipOval circularLogoWidget(String imageName) {
  return ClipOval(
    child: Image.asset(
      imageName,
      fit: BoxFit.cover,
      width: 180,
      height: 180,
      // color: Colors.white,
    ),
  );
}

//reusable textFields
TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller, String errorText) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(
      color: Colors.white.withOpacity(0.9),
    ),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      errorText: errorText,
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      // border: InputBorder.none, // No border
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(
            color: Colors.blue), // Border color for focus state
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide:
            const BorderSide(color: Colors.red), // Border color for error state
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(
            color: Colors.red), // Border color for focused error state
      ),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

//reusable button

Container signInButton(BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(98)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.black26;
          }
          return Colors.white;
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      child: Text(
        isLogin ? 'Log In' : 'Sign Up',
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    ),
  );
}

GestureDetector linkPages(context, bool isLogin) {
  return GestureDetector(
    onTap: () {
      if (isLogin) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const SignupScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const SigninScreen()),
        );
      }
    },
    child: Text(
      isLogin ? 'Don\'t have an account? Sign Up' : 'Have an account? Sign In',
      style: const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
        fontSize: 15.0,
        decoration: TextDecoration.underline,
      ),
    ),
  );
}

Row linkAuthPages(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        'Dont Have An Account?',
        style: TextStyle(
          color: Colors.white70,
          fontSize: 15.0,
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const SignupScreen();
              },
            ),
          );
        },
        child: const Text(
          'Sign Up',
          style: TextStyle(
              color: Colors.white70,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline),
        ),
      )
    ],
  );
}
