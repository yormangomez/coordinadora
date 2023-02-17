class GeneralException implements Exception {
  final String msg;

  GeneralException(this.msg);

  @override
  String toString() => msg;
}
