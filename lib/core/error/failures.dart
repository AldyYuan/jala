import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

const String serverFailureMessage = 'Server Failure, please try again later.';

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}
