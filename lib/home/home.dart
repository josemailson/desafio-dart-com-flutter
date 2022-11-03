import 'package:cadastro_clientes/registration/registration_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          body: ListView(
            children: const [
              ListTile(
                title: Text('Pães e Doces'),
                subtitle: Text('CNPJ: 11.941.838/0001-04'),
              ),
              ListTile(
                title: Text('Telas'),
                subtitle: Text('CNPJ: 92.456.516/0001-63'),
              ),
              ListTile(
                title: Text('A e G Financeira'),
                subtitle: Text('CNPJ: 96.748.482/0001-31'),
              ),
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RegistrationPage())),
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
