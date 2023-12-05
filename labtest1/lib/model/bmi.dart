import '../Controller/sqlite_db.dart';

class BMIApp {
  static const String SQLiteTable = "bmi";
  int? id;
  String username;
  double weight;
  double height;
  String gender;
  String status;
  BMIApp (this.username, this.weight, this.height, this.gender, this.status);

  BMIApp.fromJson(Map<String, dynamic> json)
      : username = json['username'] as String,
        weight = double.parse(json['weight'] as dynamic),
        height = double.parse(json['height'] as dynamic),
        gender = json['gender'] as String,
        status = json['bmi_status'] as String,
        id = json['id'] as int?;

  Map<String, dynamic> toJson() =>
      {'username': username, 'weight': weight, 'height': height, 'gender': gender, 'status': status};

  //add save
  Future<bool> save() async {
    // Save to local SQLite
    int result = await SQLiteDB().insert(SQLiteTable, toJson());
    if (result != 0) {
      return true;
    } else {
      return false;
    }
  }

}