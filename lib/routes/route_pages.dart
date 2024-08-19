import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:local_prefrences/pref/local_prefrences.dart';
import 'package:local_prefrences/routes/routes.dart';

import '../pages/about_page.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../pages/page_holder.dart';
import '../pages/profile_page.dart';
import '../pages/register_page.dart';

class RoutePages {
  static get router => GoRouter(
      redirect: (context, state){
        if(isLoggedIn()){
          return state.fullPath;
        }else{
          if(state.fullPath == Routes.register){
            return Routes.register;
          }
          else if(state.fullPath ==Routes.login){
            return Routes.login;
          }
          else {
            return Routes.login;
          }
        }
      },
      routes: [
        GoRoute(
            path: Routes.login,
            name: Routes.login,
            pageBuilder: (context, state) => MaterialPage(child: LoginPage())),
        GoRoute(
            path: Routes.register,
            name: Routes.register,
            pageBuilder: (context, state) =>
                MaterialPage(child: RegisterPage())),
        ShellRoute(
            builder: (context, state, child) => PageHolder(
                  child: child,
                ),
            routes: [
              GoRoute(
                  path: Routes.home,
                  name: Routes.home,
                  pageBuilder: (context, state) =>
                      const MaterialPage(child: HomePage())),
              GoRoute(
                  path: Routes.about,
                  name: Routes.about,
                  pageBuilder: (context, state) =>
                      const MaterialPage(child: AboutPage())),
              GoRoute(
                  path: Routes.profile,
                  name: Routes.profile,
                  pageBuilder: (context, state) =>
                      const MaterialPage(child: ProfilePage())),
            ])
      ]);
  static bool isLoggedIn() {
    final username = LocalPreferences.getString('userName');
    final pass = LocalPreferences.getString('password');

    if(username != '' && pass != ''){
      return true;
    }else{
      return false;
    }
  }
}
