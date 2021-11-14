class Contact {
  int? id;
  String name;
  String phoneNumber;
  String email;
  String description;
  bool favorite;
  int sex;

  Contact({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.description,
    required this.favorite,
    required this.sex,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "desc": description,
      "phone": phoneNumber,
      "sex": sex,
      "favorite": favorite ? 1 : 0,
     
    };
  }

  factory Contact.fromMap(Map<String, dynamic>? kmMap) {
    print(kmMap);
    return Contact(
      id: kmMap?["id"],
      name: kmMap?["name"],
      phoneNumber: kmMap?["phone"],
      email: kmMap?["email"],
      favorite: kmMap?["favorite"] == 1 ? true : false,
      sex: kmMap?["sex"],
      description: kmMap?["desc"],
    );
  }
}
