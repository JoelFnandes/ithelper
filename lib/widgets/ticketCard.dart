import 'package:flutter/material.dart';
import 'package:ithelper/screens/ticket/ticket.dart';

class TicketCard extends StatelessWidget {
  String _header;
  String _subheader;
  String _status;
  String _importance;
  String _solicitante;
  String _tecnico;
  DateTime _dataAbertura;
  String _descricao;
  List<String> _historicoAcoes;

  TicketCard(
      this._header,
      this._subheader,
      this._status,
      this._importance,
      this._solicitante,
      this._tecnico,
      this._dataAbertura,
      this._descricao,
      this._historicoAcoes);

  Color getColor() {
    switch (_importance) {
      case 'N':
        return Colors.deepPurple;
      case 'M':
        return Colors.amber;
      case 'A':
        return Colors.orange;
      case 'U':
        return Colors.red;
      default:
        return Colors.indigo;
    }
  }

  void setSolicitante(String solicitante) {
    this._solicitante = solicitante;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Ticket(
                  _header,
                  _subheader,
                  _status,
                  _importance,
                  _solicitante,
                  _tecnico,
                  _dataAbertura,
                  _descricao,
                  _historicoAcoes)),
        );
      },
      child: Container(
        height: 80,
        width: 328,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                child: const CircleAvatar(
                  radius: 30,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                    ),
                    Text(_header,
                        style: Theme.of(context).textTheme.titleMedium),
                    Text(_subheader,
                        style: Theme.of(context).textTheme.bodyMedium)
                  ],
                ),
              ),
              const Spacer(flex: 1),
              Container(
                width: 20,
                height: 80,
                color: getColor(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
