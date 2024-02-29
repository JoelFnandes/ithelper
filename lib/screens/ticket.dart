import 'package:flutter/material.dart';

class Ticket extends StatelessWidget {
  final String _tituloChamado;
  final String _nomeDepatamento;
  final String _statusChamado;
  final String _importance;

  Ticket(this._tituloChamado, this._nomeDepatamento, this._statusChamado,
      this._importance);

  String getImportance(String importance) {
    switch (importance) {
      case 'N':
        return 'Normal';
      case 'M':
        return 'Moderada';
      case 'A':
        return 'Alta';
      case 'U':
        return 'Urgente';
      default:
        return 'Normal';
    }
  }

  String getStatusChamado(String status) {
    switch (status) {
      case 'N':
        return 'Normal';
      case 'M':
        return 'Moderada';
      case 'A':
        return 'Alta';
      case 'U':
        return 'Urgente';
      default:
        return 'Normal';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            _tituloChamado,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(children: [
              Wrap(
                direction: Axis.horizontal,
                clipBehavior: Clip.antiAlias,
                spacing: 12.0,
                children: [
                  Chip(
                      avatar: Icon(Icons.pin_drop),
                      label: Text(_nomeDepatamento)),
                  Chip(label: Text(_statusChamado)),
                  Chip(
                      label: Text("Prioridade: ${getImportance(_importance)}")),
                ],
              ),
            ]),
          ),
        ));
  }
}
