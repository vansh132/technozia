// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DuoRegistration {
  final String leader;
  final String participantOne;
  final String participantTwo;
  final String participantThree;
  final String participantFour;
  final String participantFive;
  final int phoneNo;
  final String email;
  final String eventName;
  final int amount;
  final String paymentMode;
  final String paymentId;
  final String date;
  DuoRegistration({
    required this.leader,
    required this.participantOne,
    required this.participantTwo,
    required this.participantThree,
    required this.participantFour,
    required this.participantFive,
    required this.phoneNo,
    required this.email,
    required this.eventName,
    required this.amount,
    required this.paymentMode,
    required this.paymentId,
    required this.date,
  });
 

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'leader': leader,
      'participantOne': participantOne,
      'participantTwo': participantTwo,
      'participantThree': participantThree,
      'participantFour': participantFour,
      'participantFive': participantFive,
      'phoneNo': phoneNo,
      'email': email,
      'eventName': eventName,
      'amount': amount,
      'paymentMode': paymentMode,
      'paymentId': paymentId,
      'date': date,
    };
  }

  factory DuoRegistration.fromMap(Map<String, dynamic> map) {
    return DuoRegistration(
      leader: map['leader'] as String,
      participantOne: map['participantOne'] as String,
      participantTwo: map['participantTwo'] as String,
      participantThree: map['participantThree'] as String,
      participantFour: map['participantFour'] as String,
      participantFive: map['participantFive'] as String,
      phoneNo: map['phoneNo'] as int,
      email: map['email'] as String,
      eventName: map['eventName'] as String,
      amount: map['amount'] as int,
      paymentMode: map['paymentMode'] as String,
      paymentId: map['paymentId'] as String,
      date: map['date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DuoRegistration.fromJson(String source) => DuoRegistration.fromMap(json.decode(source) as Map<String, dynamic>);
}
