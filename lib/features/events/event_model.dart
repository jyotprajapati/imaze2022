import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  String? department;
  String? desc;
  String? name;
  String? type;
  String? time;
  String? venue;
  String? date;

  Event(
      {this.department,
      this.desc,
      this.name,
      this.type,
      this.time,
      this.venue,
      this.date});

  Event.fromJson(Map<String, dynamic> json) {
    department = json['department'];
    desc = json['desc'];
    name = json['name'];
    type = json['type'];
    time = json['time'];
    venue = json['venue'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['department'] = this.department;
    data['desc'] = this.desc;
    data['name'] = this.name;
    data['type'] = this.type;
    data['time'] = this.time;
    data['venue'] = this.venue;
    data['date'] = this.date;
    return data;
  }

  Event.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    department = data['department'];
    desc = data['desc'];
    name = data['name'];
    type = data['type'];
    time = data['time'];
    venue = data['venue'];
    date = data['date'];
  }
}
