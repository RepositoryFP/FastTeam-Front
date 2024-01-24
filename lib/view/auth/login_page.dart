import 'package:flutter/material.dart';
import 'package:Fast_Team/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //server controller
  LoginController? loginController;

  //input controller
  TextEditingController? emailInput;
  TextEditingController? passwordInput;
  
  @override
  void initState() {
    super.initState();
    initConstructor();
  }

  initConstructor() {
    emailInput = TextEditingController();
    passwordInput = TextEditingController();
    loginController = Get.put(LoginController());
  }

  @override
  Widget build(BuildContext context) {

    Widget logo() => SizedBox(
      width: 50.0,
      height: 50.0,
      child: Image.asset('assets/img/logo.png'),
    );

    Widget appName() => const Text(
        'Fast Team',
        style: TextStyle(
          color: Color.fromARGB(255, 2, 65, 128),
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
        ),
      );

    Widget emailFormInput() => TextFormField(
          controller: emailInput,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.email),
            hintText: "Email",
            labelText: "Email",
          ),
          keyboardType: TextInputType.emailAddress,
        );

    Widget passwordFormInput() => TextFormField(
          controller: passwordInput,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.lock),
            hintText: "Password",
            labelText: "Password",
          ),
          keyboardType: TextInputType.text,
          obscureText: true,
        );

    showSnackBar(message) {
      snackbar() => SnackBar(
        content: Text(
          message,
          style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
              color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
        duration: const Duration(milliseconds: 2000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar());
    } 

    Widget _buildButton(BuildContext context, 
      TextEditingController emailInput,
      TextEditingController passwordInput,
      LoginController controller) {
      
      requestLogin() async {
        var userResult = await controller.requestLoginUser(emailInput.text, passwordInput.text);

        if (userResult['status'] == 200) {
          if (userResult['details']['status'] == "success") {
            controller.storeUserInfo(userResult['details']['data']);
            var employeeResult = await controller.retrieveEmployeeInfo(userResult['details']['data']['id_user'] ?? 0);
            
            if (employeeResult['status'] == 200) {
              controller.storeEmployeeInfo(employeeResult['details']);
              Navigator.pushReplacementNamed(context, '/home');
            } else {
              showSnackBar('Server dalam gangguan');
            }
          } else if (userResult['details']['status'] == "error") {
              showSnackBar(userResult['details']['message']);
          }
        } else {
          showSnackBar('Server dalam gangguan');
        }
      }

      validateFormInput() async {
        if(emailInput.text.isEmpty && passwordInput.text.isEmpty) {
          showSnackBar("Email and password cannot be empty");
        } else if(emailInput.text.isEmpty) {
          showSnackBar("Email cannot be empty");
        } else if(passwordInput.text.isEmpty) {
          showSnackBar("Password cannot be empty");
        } else {
          await requestLogin();
        }
      }

       Widget buttonSubmission() => InkWell(
        onTap: () => validateFormInput(),
        splashColor: Color.fromARGB(255, 77, 74, 238),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          width: 400,
          height: 57,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 2, 65, 128),
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: const Center(
            child: Text(
              'Login',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );

      return buttonSubmission();
    }

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        logo(),
                        const SizedBox(height: 16.0),
                        appName(),
                        const SizedBox(height: 32.0),
                        emailFormInput(),
                        const SizedBox(height: 16.0),
                        passwordFormInput(),
                        const SizedBox(height: 16.0),
                        _buildButton(context, emailInput!, passwordInput!, loginController!)
                      ]
                    )
                  ]
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}