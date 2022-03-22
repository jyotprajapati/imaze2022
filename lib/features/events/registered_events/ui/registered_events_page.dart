import 'package:flutter/material.dart';
import 'package:imaze2k22/features/events/registered_events/events_controller.dart';

import '../../event_model.dart';

class RegisteredEventsPage extends StatefulWidget {
  const RegisteredEventsPage({Key? key}) : super(key: key);

  @override
  State<RegisteredEventsPage> createState() => _RegisteredEventsPageState();
}

class _RegisteredEventsPageState extends State<RegisteredEventsPage> {
  List<Event> events = [];

  getRegisteredEvents() async {
    List<UserEvent> _userEvents =
        await EventsController().getCurrentUserRegisteredEvents();

    events = await EventsController().getRegisteredEventsDetails(_userEvents);
    setState(() {});
  }

  @override
  void initState() {
    getRegisteredEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: events.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(events[index].name ?? ""),
                  subtitle: Text(events[index].desc ?? ""),
                  onTap: () {},
                );
              },
            ),
    );
  }
}
