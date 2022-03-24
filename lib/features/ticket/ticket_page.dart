import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:imaze2k22/core/Widgets/widget.dart';
import 'package:imaze2k22/features/ticket/ticket_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  Map<String, dynamic>? data;
  @override
  void initState() {
    TicketController().getTicketData().then((value) {
      data = value;
      print(data);
      setState(() {});
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImazeLogo(),
          Spacer(),
          Center(
            child: Text('Ticket Page'),
          ),
          data == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : QrImage(
                  backgroundColor: Colors.white,
                  data: jsonEncode(data),
                  version: QrVersions.auto,
                  size: 200.0,
                ),
          Text(
            DateTime.now().toString(),
            style: TextStyle(color: Colors.white),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
