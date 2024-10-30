class AppUser {
  AppUser({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
  });
  final String id;
  final String name;
  final String email;
  final String token;

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json['user']['id'] as String,
      name: json['user']['name'] as String,
      email: json['user']['email'] as String,
      token: json['token'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'user': {
          'id': id,
          'name': name,
          'email': email,
        },
        'token': token,
      };

  @override
  String toString() {
    return 'AppUser(id:$id,name:$name,email:$email)';
  }
}
