import 'error_handle.dart';

class ServiceException implements Exception {
  final ErrorHandleApi errorHandle;
  const ServiceException(this.errorHandle);
}
