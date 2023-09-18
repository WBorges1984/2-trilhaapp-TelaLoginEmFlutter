import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController(text: "");
  var senhaController = TextEditingController(text: "");
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 40, 28, 53),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Expanded(
                        flex: 8,
                        child: Image.network(
                          "https://hermes.digitalinnovation.one/assets/diome/logo.png",
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Já tem Cadastro?",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Faça seu login e make the change_",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: 30,
                    alignment: Alignment.center,
                    child: TextField(
                      controller: emailController,
                      onChanged: (value) {
                        debugPrint(value);
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(top: 0),
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color.fromARGB(255, 141, 79, 151),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      height: 30,
                      alignment: Alignment.center,
                      child: TextField(
                        controller: senhaController,
                        obscureText: isObscureText,
                        onChanged: (value) {
                          debugPrint(value);
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(top: 0),
                            hintText: "Senha",
                            hintStyle: const TextStyle(color: Colors.white),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Color.fromARGB(255, 141, 79, 151),
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  isObscureText = !isObscureText;
                                });
                              },
                              child: Icon(
                                isObscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: const Color.fromARGB(255, 141, 79, 151),
                              ),
                            )),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                          onPressed: () {
                            if (emailController.text.trim() == "123" &&
                                senhaController.text.trim() == "") {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MainPage()));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Erro no login e senha...")));
                            }
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 141, 79, 151))),
                          child: const Text(
                            "ENTRAR",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          )),
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: 30,
                    alignment: Alignment.center,
                    child: const Text(
                      "Esqueci minha senha",
                      style: TextStyle(color: Colors.yellow),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: 30,
                    alignment: Alignment.center,
                    child: const Text(
                      "Criar conta",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
