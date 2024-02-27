import 'package:flutter/material.dart';
import 'package:ithelper/authContext.dart';
import 'package:ithelper/controller/loginController.dart';
import 'package:ithelper/models/user.dart';
import 'package:ithelper/screens/authentication/register.dart';
import 'package:ithelper/screens/homes/homeTec.dart';
import 'package:ithelper/screens/homes/homeUser.dart';
import 'package:ithelper/service/authService.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final authService = AuthService();
  final authContext = AuthContext();
  final loginController = LoginController();

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

                            // Se a autenticação for bem-sucedida ele vai retornar o User
                            User? loggedIn =
                                await loginController.login(context ,username, password);

                            //Verifica se o que foi retornado pro "loggedIn" não é nulo e navega pra Home passando o User
                            if (loggedIn != null) {
                              Provider.of<AuthContext>(context, listen: false)
                                  .updateUser(loggedIn);
                              switch (loggedIn.tipoUsuario) {
                                case "U":
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeUser()),
                                  );
                                case "T":
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeTec()),
                                  );
                              }
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
