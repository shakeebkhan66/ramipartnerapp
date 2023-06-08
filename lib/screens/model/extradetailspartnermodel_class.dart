
// class GetExtraDetailsModel {
//   final String nickName;
//   final String preferredPhoneNumber;
//
//   GetExtraDetailsModel({
//     required this.nickName,
//     required this.preferredPhoneNumber,
//   });
//
//   factory GetExtraDetailsModel.fromJson(Map<dynamic, dynamic> json) {
//     return GetExtraDetailsModel(
//       nickName: json['nickName'],
//       preferredPhoneNumber: json['preferredPhoneNumber'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'nickName': nickName,
//       'preferredPhoneNumber': preferredPhoneNumber,
//     };
//   }
// }


class GetExtraDetailsModel {
  final String nickName;
  final String preferredPhoneNumber;

  GetExtraDetailsModel({
    required this.nickName,
    required this.preferredPhoneNumber,
  });

  factory GetExtraDetailsModel.fromJson(Map<dynamic, dynamic> json) {
    final nickName = json['nickName'];
    final preferredPhoneNumber = json['preferredPhoneNumber'];

    return GetExtraDetailsModel(
      nickName: nickName != null ? nickName.toString() : '',
      preferredPhoneNumber: preferredPhoneNumber != null ? preferredPhoneNumber.toString() : '',
    );
  }
}

