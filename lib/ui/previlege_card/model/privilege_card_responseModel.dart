class PrivilegeCardResponseModel {
  PrivilegeCardResponseModel({
    required this.message,
    required this.error,
    required this.errors,
  });
  late final String message;
  late final bool? error;
  late final List<dynamic> errors;

  PrivilegeCardResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    errors = List.castFrom<dynamic, dynamic>(json['errors']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    data['error'] = error;
    data['errors'] = errors;
    return data;
  }
}
