import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class Ticket extends StatelessWidget {
  final String _tituloChamado;
  final String _nomeDepartamento;
  final String _statusChamado;
  final String _importance;
  final String _solicitante;
  final String _tecnico;
  final DateTime _dataAbertura;
  final String _descricao;
  final List<String> _historicoAcoes;

  Ticket(
    this._tituloChamado,
    this._nomeDepartamento,
    this._statusChamado,
    this._importance,
    this._solicitante,
    this._tecnico,
    this._dataAbertura,
    this._descricao,
    this._historicoAcoes,
  );

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

  String getStatusChamado(String status) {
    switch (status) {
      case 'P':
        return 'Pendente';
      case 'A':
        return 'Em Atendimento';
      case 'F':
        return 'Finalizado';
      case 'C':
        return 'Cancelado';
      default:
        return 'Pendente';
    }
  }

  String formatDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy - HH:mm');
    return formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getColor(),
        title: Text(
          _tituloChamado,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: 115,
                  width: double.infinity,
                  color: getColor(),
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(15, 5, 8, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Aberto em: ${formatDateTime(_dataAbertura)}",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://s2.glbimg.com/NO_M4iaJsCFNGREcDgjwuyXQ5f8=/smart/e.glbimg.com/og/ed/f/original/2019/07/24/wesley_snipes_blade.jpg"),
                            radius: 25.0,
                          ),
                          SizedBox(width: 10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(_solicitante,
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              Text(
                                'Solicitante',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 8, 15, 0),
                child: Row(
                  children: [
                    Chip(
                      label: Text(getStatusChamado(_statusChamado)),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Chip(
                      label: Text("Prioridade: ${getImportance(_importance)}"),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: getColor(), // Cor da borda
                          width: 1, // Largura da borda
                        ),
                        borderRadius:
                            BorderRadius.circular(8), // Arredondamento da borda
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Chip(
                      avatar: Icon(Icons.pin_drop),
                      label: Text(_nomeDepartamento),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15, 8, 15, 0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Chip(
                        label: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://s2.glbimg.com/NO_M4iaJsCFNGREcDgjwuyXQ5f8=/smart/e.glbimg.com/og/ed/f/original/2019/07/24/wesley_snipes_blade.jpg"),
                              radius: 22.0,
                            ),
                            SizedBox(width: 10.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Teste",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium),
                                Text(
                                  'Técnico',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Descrição:",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${_descricao}",
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
