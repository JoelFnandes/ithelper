import 'package:flutter/material.dart';

class Ticket extends StatelessWidget {
  const Ticket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Chamado",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(children: [
              const Wrap(
                direction: Axis.horizontal,
                clipBehavior: Clip.antiAlias,
                spacing: 12.0,
                children: [
                  Chip(
                      avatar: Icon(Icons.pin_drop),
                      label: Text("Setor de contabilidade")),
                  Chip(label: Text("Aguardando")),
                  Chip(label: Text("Urgente")),
                ],
              ),
            ]),
          ),
        ));
  }
}
