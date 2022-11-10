class UpdateData {
  bool? status;
  String? message;


  UpdateData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}
