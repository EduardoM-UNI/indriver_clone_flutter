import 'package:indriver_clone_flutter/src/domain/models/Role.dart';

class User {
    int id;
    String name;
    String lastname;
    String email;
    String phone;
    dynamic image;
    dynamic notificationToken;
    DateTime createAt;
    DateTime updateAt;
    List<Role> roles;

    User({
      required this.id,
      required this.name,
      required this.lastname,
      required this.email,
      required this.phone,
      required this.image,
      required this.notificationToken,
      required this.createAt,
      required this.updateAt,
      required this.roles,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"],
        notificationToken: json["notification_token"],
        createAt: DateTime.parse(json["create_at"]),
        updateAt: DateTime.parse(json["update_at"]),
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "image": image,
        "notification_token": notificationToken,
        "create_at": createAt.toIso8601String(),
        "update_at": updateAt.toIso8601String(),
        "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
    };
}