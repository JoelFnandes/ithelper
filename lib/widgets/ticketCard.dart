import 'package:flutter/material.dart';
import 'package:ithelper/screens/ticket.dart';

// ignore: must_be_immutable
class TicketCard extends StatelessWidget {
  String _header = "";
  String _subheader = "";
  int _importance = 0;

  TicketCard(this._header, this._subheader, this._importance);

  Color getColor() {
    switch (_importance) {
      case 0:
        return Colors.deepPurple;
      case 1:
        return Colors.amber;
      case 2:
        return Colors.orange;
      case 3:
        return Colors.red;
      default:
        return Colors.indigo;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navegar para a página do perfil
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Ticket(),
            ));
      },
      child: Container(
        height: 80,
        width: 328,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              padding: EdgeInsets.all(12.0),
              child: const CircleAvatar(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_header, style: Theme.of(context).textTheme.titleLarge),
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
          ]),
        ),
      ),
    );
  }
}
