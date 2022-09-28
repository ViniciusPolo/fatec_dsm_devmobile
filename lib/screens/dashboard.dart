import '/screens/contatos/formulario_contato.dart';
import '/screens/transferencias/lista_transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Dashboard';
var yellow = Color.fromARGB(255, 255, 242, 18);
var orange = Color.fromARGB(255, 236, 112, 0);
var blue = Color.fromARGB(255, 0, 51, 153);

class MenuDashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MenuDashboardState();
  }
}

class MenuDashboardState extends State<MenuDashboard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        title:
            Text(_tituloAppBar, style: TextStyle(fontSize: 20, color: yellow)),
      ),
      backgroundColor: orange,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                _FeatureItem(
                  'Contatos',
                  Icons.contact_mail_sharp,
                  onClick: () => _exibeListaContato(context),
                ),
                _FeatureItem(
                  'Transferências',
                  Icons.monetization_on,
                  onClick: () => _exibeListaTransferencia(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _exibeListaContato(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ListaContatos(),
    ));
  }

  void _exibeListaTransferencia(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ListaTransferencia(),
    ));
  }
}

class _FeatureItem extends StatelessWidget {
  final String nome;
  final IconData icone;
  final Function onClick;

  _FeatureItem(this.nome, this.icone, {required this.onClick})
      : assert(icone != null),
        assert(onClick != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        child: InkWell(
          onTap: () {
            onClick();
          },
          child: Container(
            height: 100,
            width: 150,
            color: blue,
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  icone,
                  color: yellow,
                  size: 50.0,
                ),
                Text(
                  nome,
                  style: TextStyle(
                    color: yellow,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
