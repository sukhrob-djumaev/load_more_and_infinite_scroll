import 'package:freezed_annotation/freezed_annotation.dart';

part 'state_status.freezed.dart';
part 'state_status.g.dart';

@freezed
class StateStatus with _$StateStatus {
  const factory StateStatus() = PureStatus;
  const factory StateStatus.loading() = LoadingStatus;
  const factory StateStatus.success([dynamic data]) = SuccessStatus;
  const factory StateStatus.error([String? message]) = ErrorStatus;

  factory StateStatus.fromJson(Map<String, dynamic> json) => _$StateStatusFromJson(json);
}
