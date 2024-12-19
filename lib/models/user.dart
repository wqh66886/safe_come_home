// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String name;
  final String email;
  final String token;
  final String avatar;
  final String gender;
  final DateTime createdAt;
  final DateTime updatedAt;
  User({
    required this.name,
    required this.email,
    required this.token,
    required this.avatar,
    required this.gender,
    required this.createdAt,
    required this.updatedAt,
  });

  User copyWith({
    String? name,
    String? email,
    String? token,
    String? avatar,
    String? gender,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      token: token ?? this.token,
      avatar: avatar ?? this.avatar,
      gender: gender ?? this.gender,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'token': token,
      'avatar': avatar,
      'gender': gender,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      token: map['token'] ?? '',
      avatar: map['avatar'] ?? '',
      gender: map['gender'] ?? '',
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(name: $name, email: $email, token: $token, avatar: $avatar, gender: $gender, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.token == token &&
        other.avatar == avatar &&
        other.gender == gender &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        token.hashCode ^
        avatar.hashCode ^
        gender.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
