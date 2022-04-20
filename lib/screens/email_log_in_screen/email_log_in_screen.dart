import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nectar_ui_ux/screens/email_log_in_screen/email_signup_screen.dart';
class EmailLogInScreen extends StatefulWidget {
  const EmailLogInScreen({Key? key}) : super(key: key);

  @override
  State<EmailLogInScreen> createState() => _EmailLogInScreenState();
}

class _EmailLogInScreenState extends State<EmailLogInScreen> {

  final _formKey = GlobalKey<FormState>();

  var email = "";
  var password = "";

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordVisible = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
                      Text("Log in", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text("Enter your email and password", style: TextStyle(fontSize: 15,color: Colors.grey),),
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
                      onChanged: (value) => setState(() => this.password = value),
                      onSubmitted: (value) => setState(() => this.password = value),
                      decoration: InputDecoration(
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text("Forgot password?", style: TextStyle(color: Colors.black),),),
                ],
              ),
              SizedBox(height: 10,),
              Container(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  child: Text("Log in"),
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
                    Text("Don\'t have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const EmailSignUpScreeen(),
                              ));
                        }, 
                        child: Text('Signup', style: TextStyle(color: Colors.green),)),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
