import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:local_prefrences/pref/local_prefrences.dart';
import '../routes/routes.dart';

class AuthController {
  final TextEditingController rFullNameContrller = TextEditingController();
  final TextEditingController rEmailContrller = TextEditingController();
  final TextEditingController rUsernameContrller = TextEditingController();
  final TextEditingController rPasswordContrller = TextEditingController();

  final TextEditingController lUsernameController = TextEditingController();
  final TextEditingController lPasswordController = TextEditingController();

  Future registerAccount(BuildContext context) async {
    await LocalPreferences.setString("fullName", rFullNameContrller.text);
    await LocalPreferences.setString("email", rEmailContrller.text);
    await LocalPreferences.setString("userName", rUsernameContrller.text);
    await LocalPreferences.setString("password", rPasswordContrller.text);

    context.go(Routes.home);
  }

  Future login(BuildContext context) async {
    final uname = LocalPreferences.getString("userName");
    final pass = LocalPreferences.getString("password");

    if (uname != lUsernameController.text && pass != lPasswordController.text) {
      Fluttertoast.showToast(msg: 'Your credential is wrong!');
      return;
    } else {
      Fluttertoast.showToast(msg: 'Login Success');
      context.go(Routes.home);
      return;
    }
  }
}
