
class Visitor {
  final int id;
  final String name;
  final String date;
  final String cnic;

  Visitor({required this.id, required this.name, required this.date, required this.cnic});

  factory Visitor.fromJson(Map<String, dynamic> json) {
    return Visitor(
      id: json['id'],
      name: json['name'],
      date: json['date'],
      cnic: json['cnic'],
    );
  }

  Visitor copyWith({int? id, String? name, String? date, String? cnic}) {
    return Visitor(
      id: id ?? this.id,
      name: name ?? this.name,
      date: date ?? this.date,
      cnic: cnic ?? this.cnic,
    );
  }
}
