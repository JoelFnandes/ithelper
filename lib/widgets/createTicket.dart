import 'package:flutter/material.dart';
import 'package:ithelper/authContext.dart';
import 'package:ithelper/controller/ticketController.dart';
import 'package:ithelper/data/ticketData.dart';
import 'package:ithelper/models/employee.dart';
import 'package:ithelper/models/ticketModel.dart';
import 'package:ithelper/screens/ticket/ticket.dart';
import 'package:provider/provider.dart';

class CreateTicket extends StatefulWidget {
  @override
  _CreateTicketState createState() => _CreateTicketState();
}

class _CreateTicketState extends State<CreateTicket> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';
  String _priority = 'N';
  String _department = '';

  final ticketData = TicketData();
  final ticketController = TicketController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Novo Chamado'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Título do Chamado'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um título';
                  }
                  return null;
                },
                onSaved: (value) => _title = value!,
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Descrição'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira uma descrição';
                  }
                  return null;
                },
                onSaved: (value) => _description = value!,
              ),
              SizedBox(
                height: 30,
              ),
              DropdownButtonFormField<String>(
                value: _priority,
                decoration: InputDecoration(labelText: 'Prioridade'),
                items: [
                  DropdownMenuItem<String>(
                    value: "N",
                    child: Text("Normal"),
                  ),
                  DropdownMenuItem<String>(
                    value: "M",
                    child: Text("Moderada"),
                  ),
                  DropdownMenuItem<String>(
                    value: "A",
                    child: Text("Alta"),
                  ),
                  DropdownMenuItem<String>(
                    value: "U",
                    child: Text("Urgente"),
                  ),
                ],
                onChanged: (newValue) {
                  setState(() {
                    _priority = newValue!;
                  });
                },
              ),
              SizedBox(height: 40),
              FilledButton.tonal(
                style: FilledButton.styleFrom(
                    textStyle: TextStyle(fontSize: 20),
                    backgroundColor: Colors.deepPurple),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Obtenha o nome do usuário autenticado
                    String nomeUsuario =
                        Provider.of<AuthContext>(context, listen: false)
                                .getNomeUser() ??
                            "";

                    int _funcionario_id =
                        Provider.of<AuthContext>(context, listen: false)
                                .getIdFuncionario() ??
                            0;
                    String nomeDepartarmento =
                        Provider.of<AuthContext>(context, listen: false)
                                .getNomeDepartamentoFuncionario() ??
                            "";
                    DateTime utcNow = DateTime.now().toUtc();

                    // Crie um novo objeto TicketModel
                    TicketModel newTicket = TicketModel(
                        idChamado: DateTime.now()
                            .millisecondsSinceEpoch, // Usando o timestamp atual como ID
                        nomeUsuario: nomeUsuario,
                        tituloChamado: _title,
                        descricaoChamado: _description,
                        dataHoraAbertura: utcNow,
                        prioridade: _priority,
                        statusChamado: 'P', // Pendente por padrão
                        dataHoraFechamento: null,
                        nomeDepartamento: nomeDepartarmento,
                        idFuncionario: _funcionario_id);

                    // Adicione o novo ticket ao TicketData
                    ticketController.addNewTicket(context, newTicket);

                    // Navegar de volta ou mostrar uma mensagem de sucesso
                    Navigator.pop(context);
                  }
                },
                child: Text('Criar Chamado'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
