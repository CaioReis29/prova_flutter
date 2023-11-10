import 'package:flutter/material.dart';
import 'package:prova_flutter/src/common/show_snack_bar.dart';
import 'package:prova_flutter/src/screens/home/home_screen.dart';
import 'package:prova_flutter/src/widgets/text_field_style.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formField = GlobalKey<FormState>();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(209, 12, 52, 85),
              Color.fromARGB(209, 18, 243, 206),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Form(
                  key: _formField,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Usuário",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                      CustomTextField(
                        myController: _userController,
                        prefix: Icons.person,
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return "Campo obrigatório";
                          }
                          return "";
                        },
                      ),
                      const Text(
                        "Senha",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                      CustomTextField(
                        myController: _passController,
                        prefix: Icons.lock,
                        isSecret: true,
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          if (p0.length < 2) {
                            return 'A senha deve ter pelo menos 2 caracteres';
                          }
                          if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(p0)) {
                            return 'A senha só pode conter letras e números';
                          }
                          return "";
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 50,
                          width: 175,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 108, 209, 111),
                              elevation: 6,
                            ),
                            onPressed: () {
                              if (_formField.currentState!.validate()) {
                                _userController.clear();
                                _passController.clear();
                                showSnackBar(
                                  context: context,
                                  message: "Login efetuado com sucesso!",
                                );
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                  ),
                                );
                              }
                            },
                            child: const Text(
                              "Entrar",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
