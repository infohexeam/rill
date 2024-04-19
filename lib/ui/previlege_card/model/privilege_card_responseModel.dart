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
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['error'] = error;
    _data['errors'] = errors;
    return _data;
  }
}
