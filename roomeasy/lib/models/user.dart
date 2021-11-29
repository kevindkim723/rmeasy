import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  String uid_;
  String name_;
  String gender_;
  String interestedIn_;
  String photo_;
  Timestamp age_;
  GeoPoint location_;

  User(this.uid_, this.name_, this.gender_, this.interestedIn_, this.photo_,
      this.age_, this.location_);

}