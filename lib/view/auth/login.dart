// import 'package:co_workit/view/bottom_bar/bottom_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_login/flutter_login.dart'; 

// const users =  {
//   'dribbble@gmail.com': '12345',
//   'hunter@gmail.com': 'hunter',
// };

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   Duration get loginTime => const Duration(milliseconds: 2250);

//   Future<String?> _authUser(LoginData data) {
//     debugPrint('Name: ${data.name}, Password: ${data.password}');
//     return Future.delayed(loginTime).then((_) {
//       if (!users.containsKey(data.name)) {
//         return 'User not exists';
//       }
//       if (users[data.name] != data.password) {
//         return 'Password does not match';
//       }
//       return null;
//     });
//   }

//   // Future<String?> _signupUser(SignupData data) {
//   //   debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
//   //   return Future.delayed(loginTime).then((_) {
//   //     return null;
//   //   });
//   // }

//   Future<String> _recoverPassword(String name) {
//     debugPrint('Name: $name');
//     return Future.delayed(loginTime).then((_) {
//       if (!users.containsKey(name)) {
//         return 'User not exists';
//       }
//       return null!;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FlutterLogin(
//       title: 'CoWorkIt',
//       logo: const AssetImage("assets/images/Coworkit-2.png"),
//       onLogin: _authUser,
//       // onSignup: _signupUser,
//       onSubmitAnimationCompleted: () {
//         Navigator.of(context).pushReplacement(MaterialPageRoute(
//           builder: (context) =>   BottomBar(),
//         ));
//       },
//       onRecoverPassword: _recoverPassword,
//     );
//   }
// }