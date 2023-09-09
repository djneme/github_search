// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String login;
  String name;
  String? location;
  String? avatar_url;
  String? repos_url;
  int followers;
  int following;
  UserModel({
    required this.login,
    required this.name,
    this.location,
    this.avatar_url,
    this.repos_url,
    required this.followers,
    required this.following,
  });

  UserModel copyWith({
    String? login,
    String? name,
    String? location,
    String? avatar_url,
    String? repos_url,
    int? followers,
    int? following,
  }) {
    return UserModel(
      login: login ?? this.login,
      name: name ?? this.name,
      location: location ?? this.location,
      avatar_url: avatar_url ?? this.avatar_url,
      repos_url: repos_url ?? this.repos_url,
      followers: followers ?? this.followers,
      following: following ?? this.following,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'login': login,
      'name': name,
      'location': location,
      'avatar_url': avatar_url,
      'repos_url': repos_url,
      'followers': followers,
      'following': following,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      login: map['login'] as String,
      name: map['name'] as String,
      location: map['location'] as String,
      avatar_url: map['avatar_url'] as String,
      repos_url: map['repos_url'] as String,
      followers: map['followers'] as int,
      following: map['following'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      login: json['login'],
      name: json['name'],
      location: json['location'],
      avatar_url: json['avatar_url'],
      repos_url: json['repos_url'],
      followers: json['followers'],
      following: json['following'],
    );
  }

  @override
  String toString() {
    return 'UserModel(login: $login, name: $name, location: $location, avatar_url: $avatar_url, repos_url: $repos_url, followers: $followers, following: $following)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.login == login &&
        other.name == name &&
        other.location == location &&
        other.avatar_url == avatar_url &&
        other.repos_url == repos_url &&
        other.followers == followers &&
        other.following == following;
  }

  @override
  int get hashCode {
    return login.hashCode ^
        name.hashCode ^
        location.hashCode ^
        avatar_url.hashCode ^
        repos_url.hashCode ^
        followers.hashCode ^
        following.hashCode;
  }
}
