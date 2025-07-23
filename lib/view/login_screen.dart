import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_instagram/view/home_screen.dart';
import 'package:ui_instagram/widget/custom_button_widget.dart';
import 'package:ui_instagram/widget/input_widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/function/validation_functions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isButtonEnabled = false;

  void _launchFacebook() async {
    final Uri url = Uri.parse('https://www.facebook.com/login');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $url')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    emailController.addListener(_checkFormFilled);
    passwordController.addListener(_checkFormFilled);
  }

  void _checkFormFilled() {
    setState(() {
      isButtonEnabled = emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: 310),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios),
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding:  EdgeInsets.only(top: 80),
          child: Column(
            children: [
              SvgPicture.asset("assets/img/Logo.svg", height: 49, width: 182),
               SizedBox(height: 39),
              InputWidget(
                textEditingController: emailController,
                hintText: "Email",
                width: 343,
                validator: validateEmail,

              ),
               SizedBox(height: 12),
              InputWidget(
                textEditingController: passwordController,
                isPassword: true,
                hintText: "Password",
                width: 343,
                validator: validatePassword,
              ),
               SizedBox(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text("Forgot password?", style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
               SizedBox(height: 20),


              CustomButton(
                onPress: isButtonEnabled
                    ? () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  }
                }
                    : null,
                backgroundColor: isButtonEnabled
                    ? Colors.blue
                    : Colors.blue.withOpacity(0.3),
                height: 44,
                width: 343,
                title: "Log in",
              ),

               SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/img/facebook.svg"),
                  TextButton(
                    onPressed: _launchFacebook,
                    child: Text("Log in with Facebook", style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),

              SizedBox(height:30),
              Row(
                children: [
                  Expanded(child: Divider(thickness: 1, color: Colors.grey[300])),
                   Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('OR', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                  ),
                  Expanded(child: Divider(thickness: 1, color: Colors.grey[300])),
                ],
              ),
               SizedBox(height:25),
              RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  children: [
                    TextSpan(
                      text: 'Sign up.',
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
               SizedBox(height: 85),
              Divider(thickness: 1, color: Colors.grey[300]),
               SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                child: Text("Instagram or Facebook", style: TextStyle(color: Colors.grey)),
              ),
               SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
