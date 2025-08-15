import 'package:equatable/equatable.dart';

/// Base class for all failures in the application.
/// Failures are used in the DOMAIN layer (business logic level).
abstract class Failure extends Equatable {
  const Failure();

  @override
  List<Object> get props => [];
}

//file failure class
class FileFailure extends Failure {
  final String message;
  const FileFailure(this.message);

  @override
  List<Object> get props => [message];
}

//permission failure class
class PermissionFailure extends Failure {
  final String permission;
  final String message;

  const PermissionFailure(this.permission, this.message);

  @override
  List<Object> get props => [permission, message];
}

//bluetooth failure class
class BluetoothFailure extends Failure {
  final String message;

  const BluetoothFailure(this.message);

  @override
  List<Object> get props => [message];
}

//wifi failure class
class WifiFailure extends Failure {
  final String message;

  const WifiFailure(this.message);

  @override
  List<Object> get props => [message];
}

//transfer failures
class TransferFailure extends Failure {
  final String message;

  const TransferFailure(this.message);

  @override
  List<Object> get props => [message];
}

//device not found failure
class DeviceNotFoundFailure extends Failure {
  final String message;

  const DeviceNotFoundFailure(this.message);

  @override
  List<Object> get props => [message];
}

//connection failure
class ConnectionFailure extends Failure {
  final String message;
  final String? deviceName;

  const ConnectionFailure(this.message, {this.deviceName});

  @override
  List<Object> get props => [message, deviceName ?? ''];
}

//general failures
class UnknownFailure extends Failure {
  final String message;

  const UnknownFailure(this.message);

  @override
  List<Object> get props => [message];
}
