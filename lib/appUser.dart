class AppUser {
  String? studentId;
  String? name;
  String? gender;
  String? telNo;
  int? points;

  AppUser(String id, String n, String g, String t, int p) {
    studentId = id;
    name = n;
    gender = g;
    telNo = t;
    points = p;
  }
  void hello() {
    print('$name says hellp');
  }
}
