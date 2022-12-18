class ExecuteDTO {
  final String date;
  final String imghref;

  ExecuteDTO({
    required this.date,
    required this.imghref,
  });

  factory ExecuteDTO.fromJson(Map<String, dynamic> json) {
    return ExecuteDTO(
      date: json['date'] as String,
      imghref: json['imghref'] as String,
    );
  }
}
