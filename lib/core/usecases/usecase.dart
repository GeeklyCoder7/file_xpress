import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failures.dart';

/// Base interface for all UseCases in the application
///
/// Every UseCase represents ONE business operation and follows this pattern:
/// 1. Takes input parameters (or NoParams if none needed)
/// 2. Executes business logic through repositories
/// 3. Returns Either<Failure, SuccessType>
///
/// This ensures:
/// - Consistent error handling across the app
/// - Easy testing and mocking
/// - Single Responsibility Principle

abstract class UseCase<Type, Params> {
  /// Execute the use case with given parameters
  /// Returns Either<Failure, Type> where:
  /// - Left side = Failure (something went wrong)
  /// - Right side = Type (success with data)
  Future<Either<Failure, Type>> call(Params params);
}

/// Use this class when a UseCase doesn't need any parameters
class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

///Base class for UseCase parameters that need validation
///
/// Example: SendFilePrams, PickFileParams, etc.

abstract class Params extends Equatable {
  const Params();
}

///parameters for file related operations
class FileParams extends Params {
  final List<String> filePaths;

  const FileParams({required this.filePaths});

  @override
  List<Object> get props => [filePaths];
}

//parameters for device operations
class DeviceParams extends Params {
  final String deviceId;
  final String deviceName;

  const DeviceParams({required this.deviceId, required this.deviceName});

  @override
  List<Object> get props => [deviceId, deviceName];
}

//parameter for file transfer operations
class TransferParams extends Params {
  final List<String> filePaths;
  final String targetDeviceId;
  final String connectionType;

  const TransferParams({
    required this.filePaths,
    required this.targetDeviceId,
    required this.connectionType,
  });

  @override
  List<Object> get props => [filePaths, targetDeviceId, connectionType];
}
