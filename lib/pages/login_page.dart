import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:local_prefrences/controller/auth_controller.dart';

import '../routes/routes.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _controller = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Hi...Welcome back!',
            style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20,),
            TextFormField(
              controller: _controller.lUsernameController,
              decoration: const InputDecoration(
                label: Text('Username'),
              ),
            ),
            TextFormField(
              controller: _controller.lPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                label: Text('Password'),
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                const Text("Don't have an account?"),
                TextButton(onPressed: ()=> context.go(Routes.register), child: const Text('Register')),
              ],
            ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: ()async{
              await _controller.login(context);
            }, child: const Text('Login')),
          ],
        ),
      ),
    );
  }
}
