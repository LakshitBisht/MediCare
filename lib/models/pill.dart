class Pill {
  int id;
  String name;
  String amount;
  String type;
  int howManyWeeks;
  String medicineForm;
  int time;
  int notifyId;

  Pill(
      {required this.id,
      required this.howManyWeeks,
      required this.time,
      required this.amount,
      required this.medicineForm,
      required this.name,
      required this.type,
      required this.notifyId});

  //------------------set pill to map-------------------

  Map<String, dynamic> pillToMap() {
    Map<String, dynamic> map = Map();
    map['id'] = id;
    map['name'] = name;
    map['amount'] = amount;
    map['type'] = type;
    map['howManyWeeks'] = howManyWeeks;
    map['medicineForm'] = medicineForm;
    map['time'] = time;
    map['notifyId'] = notifyId;
    return map;
  }

  //=====================================================

  //---------------------create pill object from map---------------------
  Pill pillMapToObject(Map<String, dynamic> pillMap) {
    return Pill(
        id: pillMap['id'],
        name: pillMap['name'],
        amount: pillMap['amount'],
        type: pillMap['type'],
        howManyWeeks: pillMap['howManyWeeks'],
        medicineForm: pillMap['medicineForm'],
        time: pillMap['time'],
        notifyId: pillMap['notifyId']);
  }
//=====================================================================

  //---------------------| Get the medicine image path |-------------------------
  String get image {
    switch (medicineForm) {
      case "Syrup":
        return "assets/images/syrup.png";
      case "Pill":
        return "assets/images/pills.png";
      case "Capsule":
        return "assets/images/capsule.png";
      case "Cream":
        return "assets/images/cream.png";
      case "Drops":
        return "assets/images/drops.png";
      case "Syringe":
        return "assets/images/syringe.png";
      default:
        return "assets/images/pills.png";
    }
  }
  //=============================================================================
}
