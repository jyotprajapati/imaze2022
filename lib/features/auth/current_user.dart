// SingleTon user class

import 'package:imaze2k22/features/events/event_model.dart';
import 'package:imaze2k22/features/events/registered_events/events_controller.dart';

class CurrentUser {
  static final CurrentUser _currentUser = CurrentUser._internal();
  String? name;
  String? email;
  String? college;
  String? dept;
  List<Event>? registeredEvents;

  factory CurrentUser() {
    return _currentUser;
  }

  CurrentUser._internal();
}
