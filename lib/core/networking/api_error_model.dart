class ApiErrorModel {
  final String? message;
  final int? code;
  dynamic errors;

  ApiErrorModel({
    this.message,
    this.code,
    this.errors,
  });
}
