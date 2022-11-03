import 'package:cadastro_clientes/home/company_model.dart';
import 'package:cadastro_clientes/home/home_controller.dart';
import 'package:cadastro_clientes/home/cnpj_repository.dart';
import 'package:cadastro_clientes/home/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:mask_input_formatter/mask_input_formatter.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final formKey = GlobalKey<FormState>();
  final cnpjController = TextEditingController();
  final razaoController = TextEditingController();
  final homeController =
      HomeController(CnpjRepositoryDio(), HomeRepositoryHttp());
  MaskInputFormatter cnpjMask = MaskInputFormatter(mask: '##.###.###/####-##');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                controller: cnpjController,
                inputFormatters: [cnpjMask],
                decoration: const InputDecoration(hintText: 'CNPJ'),
                onFieldSubmitted: (value) {
                  homeController.getCompany(value);
                },
              ),
              TextFormField(
                controller: razaoController,
                decoration: const InputDecoration(hintText: 'Razão Social'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  homeController.createCompany(CompanyModel(
                      cnpjController.text,
                      razaoController.text,
                      'fantasia',
                      'logradouro',
                      '1',
                      [Cnae(1, 'cnae1')]));
                },
                child: const Text('Cadastrar'),
              )
            ],
          ),
        ),
      )),
    );
  }
}
