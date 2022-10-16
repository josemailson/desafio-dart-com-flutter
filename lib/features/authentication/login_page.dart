import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../design_system/my_color.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login';
  const LoginPage({super.key});

  void onPressed() {
    print('outrooo clicou');
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(toolbarHeight: screenHeight * 0.045),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const SizedBox(height: kToolbarHeight),
          Image.asset('assets/images/Logotipo-Clients-horizontal-claro.png',
              height: screenHeight * 0.182, width: screenWidth * 0.602),
          const SizedBox(height: 16),
          const TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Senha',
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.visibility_off,
                  color: MyColor.black,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('Esqueceu a senha?',
                    style: Theme.of(context).textTheme.subtitle1),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: screenWidth * 0.916,
            height: screenHeight * 0.073,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('home');
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)))),
                child: const Text('ENTRAR', style: TextStyle(fontSize: 21))),
          ),
          const SizedBox(height: 16),
        ]),
      ),
    );
  }
}
