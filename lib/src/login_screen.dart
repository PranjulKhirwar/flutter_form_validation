import 'package:flutter/material.dart';
import './validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  Widget emailField(){
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Email",
      ),
      keyboardType: TextInputType.emailAddress,
      onSaved: (value){
        email = value.toString();
      },
      validator: validateEmail,
    );
  }

  Widget passwordField(){
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "password",
      ),
      obscureText: true,
      onSaved: (value){
        password = value.toString();
      },
      validator: validatePassword,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(35),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            ElevatedButton(
              child: const Text("Submit"),
              onPressed: (){
                if(formKey.currentState!.validate()){
                  formKey.currentState!.save();                 
                }
              },
            )
          ],
        ),
      ),
    );
  }
}