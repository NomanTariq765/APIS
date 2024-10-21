import 'package:api3/model/user_name.dart';
import 'package:api3/model/user_picture.dart';
import 'user_dob.dart';
import 'user_location.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String net;
  final UserName name;
  final UserDob dob;
  final UserLocation location;
  final UserPicture picture;

  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.net,
    required this.name,
    required this.dob,
    required this.location,
    required this.picture,
  });

  factory User.fromMap(Map<String, dynamic> e) {
    final name = UserName.fromMap(e['name']);
    final dob = UserDob.fromMap(e['dob']);
    final location = UserLocation.fromMap(e['location']);
    final picture = UserPicture.fromMap(e['picture']);

    return User(
      cell: e['cell'] ?? '',
      email: e['email'] ?? '',
      gender: e['gender'] ?? '',
      net: e['net'] ?? '',
      phone: e['phone'] ?? '',
      name: name,
      dob: dob,
      location: location,
      picture: picture,
    );
  }

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}
