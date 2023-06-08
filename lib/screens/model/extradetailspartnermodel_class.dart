// class GetExtraDetailsModel {
//   String? nickName;
//   String? preferredPhoneNumber;
//
//   GetExtraDetailsModel({required this.nickName, required this.preferredPhoneNumber});
//
//   factory GetExtraDetailsModel.fromJson(dynamic json) {
//     return GetExtraDetailsModel(
//       nickName: json['nickName'],
//       preferredPhoneNumber: json['preferredPhoneNumber'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data['nickName'] = nickName;
//     data['preferredPhoneNumber'] = preferredPhoneNumber;
//     return data;
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
    return GetExtraDetailsModel(
      nickName: json['nickName'],
      preferredPhoneNumber: json['preferredPhoneNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nickName': nickName,
      'preferredPhoneNumber': preferredPhoneNumber,
    };
  }
}

