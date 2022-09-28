import '/models/form_contato.dart';
import '/screens/contatos/lista_contatos.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Contatos';
var yellow = Color.fromARGB(255, 255, 242, 18);
var orange = Color.fromARGB(255, 236, 112, 0);
var blue = Color.fromARGB(255, 0, 51, 153);

class ListaContatos extends StatefulWidget {
  final List<Contatos> _contatos = [];

  @override
  State<StatefulWidget> createState() {
    return ListaContatosState();
  }
}

class ListaContatosState extends State<ListaContatos> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title:
            Text(_tituloAppBar, style: TextStyle(fontSize: 20, color: yellow)),
        backgroundColor: blue,
      ),
      backgroundColor: orange,
      body: ListView.builder(
        itemCount: widget._contatos.length,
        itemBuilder: ((context, indice) {
          final contato = widget._contatos[indice];
          return ItemContato(contato);
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: blue,
        onPressed: () {
          final Future<Contatos?> future = Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FormularioContatos();
              },
            ),
          );
          future.then(
            (contatoCriado) {
              if (contatoCriado != null) {
                setState(
                  () {
                    widget._contatos.add(
                      contatoCriado,
                    );
                  },
                );
              }
            },
          );
        },
        child: Icon(Icons.add, color: yellow),
      ),
    );
  }
}

class ItemContato extends StatelessWidget {
  final Contatos _contato;

  ItemContato(this._contato);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    backgroundColor:
    yellow;
    return Container(
      child: ListTile(
        leading: Icon(Icons.contact_mail_rounded),
        title: Text(
          'Nome: ' + _contato.nome.toString(),
          style: TextStyle(fontSize: 24.0),
        ),
        subtitle: Container(
          child: (Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Endereço: ' + _contato.endereco.toString(),
                  style: TextStyle(fontSize: 16, color: yellow)),
              Text('Telefone: ' + _contato.telefone.toString(),
                  style: TextStyle(fontSize: 16, color: yellow)),
              Text('Email: ' + _contato.email.toString(),
                  style: TextStyle(fontSize: 16, color: yellow)),
              Text('CPF: ' + _contato.cpf.toString(),
                  style: TextStyle(fontSize: 16, color: yellow)),
            ],
          )),
        ),
      ),
    );
  }
}
