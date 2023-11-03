import 'package:flutter/material.dart';
import 'package:ithelper/controller/loginController.dart';
import 'package:ithelper/screens/authentication/register.dart';
import 'package:ithelper/screens/home.dart';
import 'package:ithelper/service/authService.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  LoginController loginController = LoginController(AuthService());
  bool _isObscure = true;
  String Msg = "";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ITHelper"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Login',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                SizedBox(
                  width: 360,
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Usuário', border: OutlineInputBorder()),
                    controller: usernameController,
                    validator: (value) {
                      if (Msg != "") {
                        setState(() {
                          Msg = "";
                        });
                      }
                      if (value!.isEmpty) return "Insira seu usuário";
                    },
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 360,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      border: OutlineInputBorder(),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        child: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ),
                    controller: passwordController,
                    obscureText: _isObscure,
                    validator: (value) {
                      if (Msg != "") {
                        setState(() {
                          Msg = "";
                        });
                      }
                      if (value!.isEmpty) return "Insira sua senha";
                    },
                  ),
                ),
                SizedBox(height: 30),
                SizedBox(
                    height: 50,
                    width: 360,
                    child: FilledButton.tonal(
                        child: const Text("Entrar"),
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromRGBO(208, 188, 255, 100))),
                        onPressed: () async {
                          // Valide o formulário
                          if (_formKey.currentState!.validate()) {
                            print(
                                'Formulário válido'); // Verifique se este log é impresso
                            // Se a validação for bem-sucedida, proceda com a autenticação
                            final username = usernameController.text;
                            final password = passwordController.text;

                            bool loggedIn =
                                await loginController.login(username, password);

                            if (loggedIn) {
                              // Se a autenticação for bem-sucedida, navegue para a tela Home
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                              );
                            } else {
                              setState(() {
                                Msg = "Usuário ou senha incorreta";
                              });
                            }
                          }
                        })),
                SizedBox(height: 10),
                Text(Msg,
                    style: TextStyle(
                        color: Color.fromRGBO(248, 193, 191, 1), fontSize: 18)),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  child: const Text("Precisa de Ajuda?"),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}