import 'package:flutter/material.dart';

class Profile {
  final String userName;
  final String uid;
  final String role;
  final String email;

  final String password;
  final NetworkImage? imageProfile;
  final List<String> uidGroups;

  Profile({
    required this.userName,
    required this.uid,
    required this.role,
    required this.email,
    required this.password,
    required this.uidGroups,
    this.imageProfile,
  });
}
