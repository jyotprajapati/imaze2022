import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  String? department;
  String? desc;
  String? name;
  String? type;
  String? time;
  String? venue;
  String? date;
  String? imgUrl;

  Event(
      {this.department,
      this.desc,
      this.name,
      this.type,
      this.imgUrl,
      this.time,
      this.venue,
      this.date});

  Event.fromJson(Map<String, dynamic> json) {
    department = json['Department'];
    desc = json['RoundDescription'];
    name = json['Name'];
    type = json['Type'];
    time = json['Time'];
    venue = json['Venue'];
    date = json['Date'];

    imgUrl = json['Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Department'] = this.department;
    data['RoundDescription'] = this.desc;
    data['Name'] = this.name;
    data['Type'] = this.type;
    data['Time'] = this.time;
    data['Venue'] = this.venue;
    data['Date'] = this.date;
    return data;
  }

  Event.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    department = data['Department'];
    desc = data['RoundDescription'];
    name = data['Name'];
    type = data['Type'];
    time = data['Time'];
    venue = data['Venue'];
    date = data['Date'];
    imgUrl = data['Image'];
  }
}
