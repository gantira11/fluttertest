class AppException implements Exception {
  AppException(this.message, this.prefix);

  final String? message;
  final String? prefix;

  @override
  String toString() {
    return '$prefix, $message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, '');
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, '');
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? message]) : super(message, '');
}

class ForbiddenException extends AppException {
  ForbiddenException([String? message]) : super(message, '');
}

class NotFoundException extends AppException {
  NotFoundException([String? message]) : super(message, '');
}

class MethodNotAllowedException extends AppException {
  MethodNotAllowedException([String? message]) : super(message, '');
}

class ConflictException extends AppException {
  ConflictException([String? message]) : super(message, '');
}

class InternalServerErrorException extends AppException {
  InternalServerErrorException([String? message]) : super(message, '');
}
