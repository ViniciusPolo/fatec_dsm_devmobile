// Classe da lista de transações, chamada no body
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../../models/transferencia.dart';
import 'formulario_transferencia.dart';

const _tituloAppBar = 'Transferência';
var yellow = Color.fromARGB(255, 255, 242, 18);
var orange = Color.fromARGB(255, 236, 112, 0);
var blue = Color.fromARGB(255, 0, 51, 153);

class ListaTransferencia extends StatefulWidget {
  final List<Transferencia> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text(
            _tituloAppBar,
            style: TextStyle(fontSize: 20, color: yellow),
          ),
          backgroundColor: blue),
      backgroundColor: orange,
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: ((context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: blue,
        onPressed: () {
          final Future<Transferencia?> future = Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FormularioTransferencia();
              },
            ),
          );
          future.then(
            (transferenciaRecebida) {
              if (transferenciaRecebida != null) {
                setState(
                  () {
                    widget._transferencias.add(
                      transferenciaRecebida,
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

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    NumberFormat formatter = NumberFormat.simpleCurrency();
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.monetization_on,
        ),
        title: Text(
          formatter.format(_transferencia.valor),
        ),
        subtitle: Text(
          _transferencia.numeroConta.toString(),
        ),
      ),
    );
  }
}
