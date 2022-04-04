import 'package:flutter/material.dart';
import 'package:imaze2k22/features/events/event_model.dart';
import 'package:imaze2k22/features/events/registered_events/events_controller.dart';

import 'event_details_page.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key, required this.type}) : super(key: key);
  final String type;
  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  List<Event> events = [];
  bool isError = false;
  bool isLoading = true;
  @override
  void initState() {
    EventsController()
        .getEventsByType(widget.type)
        .then((value) => {
              setState(() {
                events = value;
                isLoading = false;
              })
            })
        .onError((error, stackTrace) {
      print(error);
      print(stackTrace);
      setState(() {
        isError = true;
      });
      throw error!;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isError
          ? Center(
              child: Text('Error'),
            )
          : isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EventDetailScreen(
                              event: events[index],
                            ),
                          ),
                        );
                      },
                      child: Card(
                        child: Hero(
                          tag: 'event_${events[index].name}',
                          child: Image.network(
                            events[index].imgUrl ?? "",
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Center(
                                child: Text(
                                  '${events[index].name}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
