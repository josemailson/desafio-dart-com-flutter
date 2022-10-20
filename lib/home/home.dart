import 'package:cadastro_clientes/features/design_system/my_color.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

var valor = 0;

void increment() {
  valor++;
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            leading: CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage('assets/images/paesedoces.png'),
              backgroundColor: MyColor.white,
            ),
          ),
          ListTile(
            title: Text('Telas'),
            subtitle: Text('CNPJ: 92.456.516/0001-63'),
            leading: CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage('assets/images/telas.png'),
              backgroundColor: MyColor.white,
            ),
          ),
          ListTile(
            title: Text('A e G Financeira'),
            subtitle: Text('CNPJ: 96.748.482/0001-31'),
            leading: CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage('assets/images/aegfinanceira.jpg'),
              backgroundColor: MyColor.white,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: const FloatingActionButton(
        onPressed: increment,
        child: Icon(Icons.add),
      ),
    );
  }
}
