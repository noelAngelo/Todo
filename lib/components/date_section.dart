import 'package:flutter/material.dart';

class DateSection extends StatelessWidget {
  const DateSection({@required this.formattedDate});

  final String formattedDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(image: AssetImage('images/avatar.png'), height: 30,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text('$formattedDate'),
                  Text('Today',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}