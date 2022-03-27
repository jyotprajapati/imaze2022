import 'package:flutter/material.dart';
import 'package:imaze2k22/core/Widgets/widget.dart';
import 'package:imaze2k22/features/events/event_model.dart';

class EventDetailScreen extends StatelessWidget {
  const EventDetailScreen({Key? key, required this.event}) : super(key: key);
  final Event event;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Hero(
            tag: "event_${event.name}",
            child: Image.network(event.imgUrl!),
          ),
          if (event.name != null)
            DarkContatiner(
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${event.name}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
              EdgeInsets.all(9),
            ),
          if (event.desc != null)
            DarkContatiner(
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${event.desc}",
                  style: TextStyle(
                    color: Colors.white,
                    // fontSize: 20,
                  ),
                ),
              ),
              EdgeInsets.all(9),
            ),
          if (event.date != null)
            DarkContatiner(
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Date: ${event.date}",
                  style: TextStyle(
                    color: Colors.white,
                    // fontSize: 20,
                  ),
                ),
              ),
              EdgeInsets.all(9),
            ),
          if (event.time != null)
            DarkContatiner(
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Time: ${event.time}",
                  style: TextStyle(
                    color: Colors.white,
                    // fontSize: 20,
                  ),
                ),
              ),
              EdgeInsets.all(9),
            ),
          if (event.venue != null)
            DarkContatiner(
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Venue: ${event.venue}",
                  style: TextStyle(
                    color: Colors.white,
                    // fontSize: 20,
                  ),
                ),
              ),
              EdgeInsets.all(9),
            ),
        ],
      ),
    );
  }
}
