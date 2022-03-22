import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../event_model.dart';

class EventsController {
  Future<List<UserEvent>> getCurrentUserRegisteredEvents() async {
    List<UserEvent> events = [];
    final user = FirebaseAuth.instance.currentUser;
    final snapShot = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.email)
        .collection('events')
        .get();
    for (final doc in snapShot.docs) {
      events.add(UserEvent.fromDocument(doc));
    }
    return events;
  }

  Future<Event> getEventForEventId(String eventId) async {
    final snapShot = await FirebaseFirestore.instance
        .collection('events')
        .doc(eventId)
        .get();
    return Event.fromDocument(snapShot);
  }

  Future<List<Event>> getRegisteredEventsDetails(
      List<UserEvent> registeredEvents) async {
    List<Event> events = [];
    for (final event in registeredEvents) {
      final snapShot = await FirebaseFirestore.instance
          .collection('events')
          .doc(event.name)
          .get();
      if (snapShot.exists) {
        events.add(Event.fromDocument(snapShot));
      }
    }
    return events;
  }
}

class UserEvent {
  late String name;
  late bool isEnjoyed;

  UserEvent({required this.name, required this.isEnjoyed});
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isEnjoyed': isEnjoyed,
    };
  }

  UserEvent.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    name = data['name'];
    isEnjoyed = data['isEnjoyed'];
  }
}
