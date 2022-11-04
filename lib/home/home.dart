import 'package:cadastro_clientes/home/cnpj_repository.dart';
import 'package:cadastro_clientes/home/company_model.dart';
import 'package:cadastro_clientes/home/home_controller.dart';
import 'package:cadastro_clientes/home/home_repository.dart';
import 'package:cadastro_clientes/registration/registration_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController(CnpjRepositoryDio(), HomeRepositoryHttp());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
            title: const Text('Clients'),
            centerTitle: true,
            actions: const [Icon(Icons.search)],
          ),
          body: FutureBuilder<List<CompanyModel>>(
              future: controller.getCompanies(),
              builder: ((context, snapshot) {
                if (snapshot.data == null && !snapshot.hasError) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  const Center(
                    child: Text('Ops, deu ruim!'),
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    final company = snapshot.data?[index];
                    return ListTile(
                      title: Text(company?.razaoSocial ?? ''),
                      trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () async {
                            final result =
                                await controller.deleteCompany(company!.id!);
                            if (result) {
                              setState(() {});
                            }
                          }),
                    );
                  },
                );
              })),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RegistrationPage())).then((_) {
              setState(() {});
            }),
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
