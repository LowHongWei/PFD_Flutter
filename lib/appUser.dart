class AppUser {
  String? studentId;
  String? name;
  String? gender;
  String? telNo;
  String? bday;
  int? points;

  AppUser(String id, String n, String g, String t, int p, String bd) {
    studentId = id;
    name = n;
    gender = g;
    telNo = t;
    points = p;
    bday = bd;
  }
  void hello() {
    print('$name says hellp');
  }
}
