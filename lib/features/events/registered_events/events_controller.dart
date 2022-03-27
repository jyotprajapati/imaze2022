import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../event_model.dart';

class EventsController {
  Future<List<UserEvent>> getCurrentUserRegisteredEvents(
      [String? email]) async {
    List<UserEvent> events = [];
    final user = FirebaseAuth.instance.currentUser;

    final snapShot = await FirebaseFirestore.instance
        .collection('users')
        .doc(email ?? user!.email)
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

  // try not to use this
  Future<List<Event>> getAllEvents() async {
    List<Event> events = [];
    final snapShot =
        await FirebaseFirestore.instance.collection('events').get();
    for (final doc in snapShot.docs) {
      events.add(Event.fromDocument(doc));
    }
    return events;
  }

  Future<List<Event>> getTechnicalEvent() async {
    List<Event> events = [];
    final snapShot = await FirebaseFirestore.instance
        .collection('events')
        .where("Type", isEqualTo: "Technical")
        .get();
    for (final doc in snapShot.docs) {
      events.add(Event.fromDocument(doc));
    }
    return events;
  }

  Future<List<Event>> getNonTechnicalEvents() async {
    List<Event> events = [];
    final snapShot = await FirebaseFirestore.instance
        .collection('events')
        .where("Type", isEqualTo: "Non-Technical")
        .get();
    for (final doc in snapShot.docs) {
      events.add(Event.fromDocument(doc));
    }
    return events;
  }

  Future<List<Event>> getEventsByType(String type) async {
    List<Event> events = [];
    final snapShot = await FirebaseFirestore.instance
        .collection('events')
        .where("Type", isEqualTo: type)
        .get();
    for (final doc in snapShot.docs) {
      events.add(Event.fromDocument(doc));
    }
    return events;
  }
}

class UserEvent {
  late String name;
  late bool isEnjoyed;
  String? leaderName;
  String? leaderEmail;

  UserEvent({required this.name, required this.isEnjoyed});
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isEnjoyed': isEnjoyed,
      'leaderName': leaderName,
      'leaderEmail': leaderEmail,
    };
  }

  UserEvent.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    name = data['name'];
    isEnjoyed = data['isEnjoyed'];
    leaderName = data['leaderName'];
    leaderEmail = data['leaderEmail'];
  }
}
