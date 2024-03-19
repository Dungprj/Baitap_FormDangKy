// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class District {
  String? name;
  String? level;
  String? id;
  String? provinceId;

  District({
    required this.name,
    required this.level,
    required this.id,
    required this.provinceId,
  });

  District copyWith({
    String? name,
    String? level,
    String? id,
    String? provinceId,
  }) {
    return District(
      name: name ?? this.name,
      level: level ?? this.level,
      id: id ?? this.id,
      provinceId: provinceId ?? this.provinceId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'level': level,
      'id': id,
      'provinceId': provinceId,
    };
  }

  factory District.fromMap(Map<String, dynamic> map) {
    String? name = map['name'];
    String? level = map['level'];
    String? id = map['id'];
    String? provinceId = map['provinceId'];

    // Kiểm tra và gán giá trị mặc định nếu các trường bị thiếu
    if (name == null || level == null || id == null || provinceId == null) {
      name = '';
      level = '';
      id = '';
      provinceId = '';
    }

    // Kiểm tra và chuyển đổi kiểu dữ liệu nếu cần thiết
    if (!(name is String) ||
        !(level is String) ||
        !(id is String) ||
        !(provinceId is String)) {
      name = name.toString();
      level = level.toString();
      id = id.toString();
      provinceId = provinceId.toString();
    }

    // Kiểm tra trường provinceId không được rỗng
    if (provinceId.isEmpty) {
      throw ArgumentError('provinceId cannot be empty.');
    }

    return District(
      name: name,
      level: level,
      id: id,
      provinceId: provinceId,
    );
  }

  String toJson() => json.encode(toMap());

  factory District.fromJson(String source) =>
      District.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'District(name: $name, level: $level, id: $id, provinceId: $provinceId)';
  }

  @override
  bool operator ==(covariant District other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.level == level &&
        other.id == id &&
        other.provinceId == provinceId;
  }

  @override
  int get hashCode {
    return name.hashCode ^ level.hashCode ^ id.hashCode ^ provinceId.hashCode;
  }
}
