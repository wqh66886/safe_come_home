// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String id;
  final String username;
  final String email;
  final String token;
  final String avatar;
  final int gender;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String phone;
  final DateTime birthday;
  User({
    required this.id,
    required this.username,
    required this.email,
    required this.token,
    required this.avatar,
    required this.gender,
    required this.createdAt,
    required this.updatedAt,
    required this.phone,
    required this.birthday,
  });

  User copyWith({
    String? id,
    String? username,
    String? email,
    String? token,
    String? avatar,
    int? gender,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? phone,
    DateTime? birthday,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      token: token ?? this.token,
      avatar: avatar ?? this.avatar,
      gender: gender ?? this.gender,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      phone: phone ?? this.phone,
      birthday: birthday ?? this.birthday,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'email': email,
      'token': token,
      'avatar': avatar,
      'gender': gender,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'phone': phone,
      'birthday': birthday.millisecondsSinceEpoch,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      token: map['token'] ?? '',
      avatar: map['avatar'] ?? '',
      gender: map['gende'] ?? 0,
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
      phone: map['phone'] ?? '',
      birthday: DateTime.parse(map['birthday']),
    );
  }

  factory User.fromConsumeMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      token: map['token'] ?? '',
      avatar: map['avatar'] ?? '',
      gender: map['gende'] ?? 0,
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
      phone: map['phone'] ?? '',
      birthday: DateTime.parse(map['birthday']),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, username: $username, email: $email, token: $token, avatar: $avatar, gender: $gender, createdAt: $createdAt, updatedAt: $updatedAt, phone: $phone, birthday: $birthday)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.username == username &&
        other.email == email &&
        other.token == token &&
        other.avatar == avatar &&
        other.gender == gender &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.phone == phone &&
        other.birthday == birthday;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        email.hashCode ^
        token.hashCode ^
        avatar.hashCode ^
        gender.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        phone.hashCode ^
        birthday.hashCode;
  }
}
