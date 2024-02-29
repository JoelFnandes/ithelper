import 'package:flutter/material.dart';
import 'package:ithelper/screens/ticket.dart';

class TicketCard extends StatelessWidget {
  final String _header;
  final String _subheader;
  final String _status;
  final String _importance;

  TicketCard(this._header, this._subheader, this._status, this._importance);

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Ticket(_header, _subheader, _status, _importance)),
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
                padding: EdgeInsets.all(12.0),
                child: const CircleAvatar(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_header,
                        style: Theme.of(context).textTheme.titleLarge),
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
