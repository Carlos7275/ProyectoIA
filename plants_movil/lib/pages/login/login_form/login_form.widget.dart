import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plants_movil/env/local.env.dart';
import 'package:plants_movil/generics/widgets/stateful.dart';
import 'package:plants_movil/pages/login/login_form/login_form.controller.dart';
import 'package:plants_movil/utilities/regex.dart';
import 'package:plants_movil/widgets/InputText/inputtext.widget.dart';
import 'package:plants_movil/widgets/space/space.widget.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);
  @override
  State createState() => _LoginFormState();
}

class _LoginFormState extends Stateful<LoginForm, LoginFormController> {
  bool isLogged = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: controller.isLoading$,
      builder: (context, snapshot) {
        if (snapshot.hasData && !snapshot.data!) {
          return Form(
            key: controller.formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: InputText(
                        controller: controller.emailController,
                        callback: Utilities.emailValidator,
                        icon: const Icon(Icons.alternate_email),
                        message: "Ingrese su Correo electronico",
                      ),
                    ),
                  ],
                ),
                Space.espaciador(15),
                Row(
                  children: [
                    Expanded(
                      child: InputText(
                        callback: Utilities.passwordValidator,
                        controller: controller.passwordController,
                        obscure: true,
                        message: "Ingrese su contraseña",
                        icon: const Icon(Icons.lock),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Center(
                      child: GestureDetector(
                          child: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text("¿Se te olvido la contraseña?",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Color.fromARGB(255, 6, 6, 6))),
                          ),
                          onTap: () async {
                            var uri = Uri.parse(
                                "${Enviroment.server}:4200/recuperarcuenta");
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(uri);
                            }
                          }),
                    ),
                  ],
                ),
                Space.espaciador(15),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.login_sharp),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(vertical: 5)),
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).colorScheme.secondary),
                        ),
                        onPressed: () => controller.enviar(context),
                        label: const Column(
                          children: [
                            Text(
                              "Iniciar Sesion",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Space.espaciador(15),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.add_circle_outline),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(vertical: 4)),
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).colorScheme.secondary),
                        ),
                        onPressed: () {
                          Modular.to.pushNamed('/registrar');
                        },
                        label: const Text(
                          "Registrarse",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          return SizedBox(
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.secondary,
                strokeWidth: 4,
              ),
            ),
          );
        }
      },
    );
  }
}
