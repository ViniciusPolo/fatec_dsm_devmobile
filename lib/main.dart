import 'dart:html';
import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screens/transferencias/lista_transferencia.dart';

void main() => runApp(Banco());

//   MaterialApp(
//     home: Scaffold(
//       body: FormularioTransferencia(),
//     ),
//   ),
// );
class Banco extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: ListaTransferencia(),
    );
  }
}
