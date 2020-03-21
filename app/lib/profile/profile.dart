class Profile {
  String name;
  DateTime birthday;

  String contactName;
  String contactTelephone;

  Profile();

  Profile.fromJson(Map<String, dynamic> json) :
        name = json["name"],
        birthday = json["birthday"],
        contactName = json["contactName"],
        contactTelephone = json["contactTelephone"];

  Map<String, dynamic> toJson() => {
    "name": name,
    "birthday": birthday,
    "contactName": contactName,
    "contactTelephone": contactTelephone
  };
}
