/// Base class for technical exceptions in the DATA layer.
/// Exceptions are thrown here and converted to Failures in repositories.
class AppException implements Exception {
  final String message;
  final String? code;

  const AppException(this.message, {this.code});

  @override
  String toString() => 'AppException: $message ${code ?? ''}';
}

//file exceptions
class FileSystemException extends AppException {
  const FileSystemException(String message, {String? code})
    : super(message, code: code);
}

//file picker exceptions
class FilePickerException extends AppException {
  const FilePickerException(String message, {String? code})
    : super(message, code: code);
}

//permission exceptions
class PermissionException extends AppException {
  final String permissionType;
  const PermissionException(String message, this.permissionType, {String? code})
    : super(message, code: code);
}

//bluetooth exceptions
class BluetoothException extends AppException {
  const BluetoothException(String message, {String? code})
    : super(message, code: code);
}

//wifi exception
class WifiException extends AppException {
  const WifiException(String message, {String? code})
    : super(message, code: code);
}

//connection exception
class ConnectionException extends AppException {
  final String? deviceId;
  const ConnectionException(String message, {this.deviceId, String? code})
    : super(message, code: code);
}

//transfer exception
class TransferException extends AppException {
  final String? fileName;
  final double? progress;

  const TransferException(
    String message, {
    this.fileName,
    this.progress,
    String? code,
  }) : super(message, code: code);
}

//platform exceptions
class PlatformException extends AppException {
  const PlatformException(String messsage, {String? code})
    : super(messsage, code: code);
}

//unsupported feature exceptions
class UnsupportedFeatureException extends AppException {
  final String feature;
  const UnsupportedFeatureException(
    String message,
    this.feature, {
    String? code,
  }) : super(message, code: code);
}
