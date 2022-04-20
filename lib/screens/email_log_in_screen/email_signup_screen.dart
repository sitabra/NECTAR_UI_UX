import 'package:flutter/material.dart';
import 'package:nectar_ui_ux/screens/email_log_in_screen/email_log_in_screen.dart';
import 'package:nectar_ui_ux/screens/welcome_screen/welcome_screen.dart';
class EmailSignUpScreeen extends StatefulWidget {
  const EmailSignUpScreeen({Key? key}) : super(key: key);

  @override
  State<EmailSignUpScreeen> createState() => _EmailSignUpScreeenState();
}

class _EmailSignUpScreeenState extends State<EmailSignUpScreeen> {
  final _formKey = GlobalKey<FormState>();

  var email = "";
  var password = "";
  var username = "";

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  bool isPasswordVisible = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/image/pngcarrot.png',height: 150,),
              Column(
                children: [
                  Row(
                    children: [
                      Text("Sign Up", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text("Enter your credentials to continue", style: TextStyle(fontSize: 15,color: Colors.grey),),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        errorStyle: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                        ),),
                      controller: usernameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an username';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        errorStyle: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                        ),),
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email';
                        } else if (!value.contains('@')) {
                          return 'Please enter valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30,),
                    TextField(
                      autofocus: false,
                      onChanged: (value) => setState(() => this.password = value),
                      onSubmitted: (value) => setState(() => this.password = value),
                      decoration: InputDecoration(
                        label: Text('Password'),
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          icon: isPasswordVisible
                              ?const Icon(Icons.visibility_off)
                              :const Icon(Icons.visibility),
                          onPressed: () =>
                              setState(() => isPasswordVisible = !isPasswordVisible),
                        ),
                      ),
                      controller: passwordController,
                      obscureText: isPasswordVisible,

                    ),
                  ],
                ),
              ),
          Row(
            children: [
              TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.black
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WelcomeScreen(),
                      ));
                },
                child: const Text.rich(
                    TextSpan(
                        children: [
                          TextSpan(text: 'By continuing you agree to our', style: TextStyle(
                              fontSize: 12)),
                          TextSpan(
                              text: '  Terms of Service',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12,color: Colors.green)),

                        ]))),
            ],
          ),
              SizedBox(height: 10,),
              Container(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  child: Text("Sign up"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        email = emailController.text;
                        password = passwordController.text;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    // fixedSize: const Size(330, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Login', style: TextStyle(color: Colors.green),)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
