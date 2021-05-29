class Model {
  int id;
  String name;
  String address;
  String from;
  String to;
  String fee_type;
  int dose1_capacity;
  int dose2_capacity;
  String fee;
  int ageLimit;
  String vaccine;
  List<String> slots;

  Model(
      this.id,
      this.name,
      this.address,
      this.ageLimit,
      this.dose1_capacity,
      this.dose2_capacity,
      this.fee_type,
      this.fee,
      this.from,
      this.to,
      this.slots,
      this.vaccine);
}
