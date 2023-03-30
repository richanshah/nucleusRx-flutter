class SendOtpToUser {
  String? phoneNumber;

  SendOtpToUser({this.phoneNumber});

  SendOtpToUser.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone_number'] = phoneNumber;
    return data;
  }
}
