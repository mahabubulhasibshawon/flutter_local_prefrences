import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:local_prefrences/routes/routes.dart';
import '../controller/auth_controller.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final _controller = AuthController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text('Create a new account', style: Theme.of(context).textTheme.bodyLarge,),
          const SizedBox(height: 20,),
          TextFormField(
            decoration: const InputDecoration(
              label: Text('Full Name'),
            ),
          ),
          const SizedBox(height: 20,),
          TextFormField(
            decoration: const InputDecoration(
              label: Text('Email'),
            ),
          ),
          const SizedBox(height: 20,),
          TextFormField(
            decoration: const InputDecoration(
              label: Text('username'),
            ),
          ),
          const SizedBox(height: 20,),
          TextFormField(
            decoration: const InputDecoration(
              label: Text('Password'),
            ),
          ),
          Row(
            children: [
              Text('Already have an account?'),
              TextButton(onPressed: ()=>context.go(Routes.login), child: Text('Login'),),
            ],
          ),
          const SizedBox(height: 20,),
          ElevatedButton(onPressed: ()async{
            await _controller.
          }, child: Text('Register'),),
        ],
      ),
    );
  }
}
