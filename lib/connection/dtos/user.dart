
class UserDTO {

  final String id;
  final String password;
  final String name;
  final String surname;
  final int age;
  final int weight;
  final int height;

  UserDTO({
    required this.id,
    required this.password,
    required this.name,
    required this.surname,
    required this.age,
    required this.weight,
    required this.height,
    });

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      id: json['id'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      age: json['age'] as int,
      weight: json['weight'] as int,
      height: json['height'] as int,
    );
  }
}
