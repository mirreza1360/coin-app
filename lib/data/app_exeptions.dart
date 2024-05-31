class AppException implements Exception {
  final String message;
  final String prefix;

  AppException(this.message, this.prefix);

  @override
  String toString() {
    return '$message $prefix';
  }
}

class FetchDataException extends AppException {
  FetchDataException(String message): super(message,'Error Duration Communication');
}

class BadRequestException extends AppException {
  BadRequestException(String message): super(message,'Invalid Request');
}

class UnauthorizeException extends AppException {
  UnauthorizeException(String message): super(message,'Unauthorize Request');
}

class InvalidInputException extends AppException {
  InvalidInputException(String message): super(message,'Invalid Input Request');
}

