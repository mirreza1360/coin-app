import 'package:shopping/data/response/status.dart';

class ApiResponse<T> {
  late Status status;
  late T data;
  late String message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.LOADING;

  ApiResponse.complate() : status = Status.COMPLATED;

  ApiResponse.error() : status = Status.ERROR;

  @override
  String toString() {
    return 'Status:$status \n Message: $message \n Date: $data';
  }
}
