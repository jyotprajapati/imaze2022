// SingleTon user class

import 'package:imaze2k22/features/events/event_model.dart';
import 'package:imaze2k22/features/events/registered_events/events_controller.dart';

class CurrentUser {
  static final CurrentUser _currentUser = CurrentUser._internal();
  late String name;
  late String email;
  late String college;
  late String dept;
  late List<Event> registeredEvents;
  late int technical;
  late int nonTechnical;
  bool? isIndividualRegistered;
  bool? isCombo;

  factory CurrentUser() {
    return _currentUser;
  }

  CurrentUser._internal();
}
