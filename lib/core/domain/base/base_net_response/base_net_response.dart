import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_net_response.freezed.dart';

@freezed
class BaseNetResponse<Data> with _$BaseNetResponse<Data> {
  const BaseNetResponse._();

  const factory BaseNetResponse.success(Data data) =
      BaseNetResponseSuccess<Data>;

  const factory BaseNetResponse.error({
    @Default(null) Data? data,
    @Default('') String message,
  }) = BaseNetResponseError<Data>;

  bool get isSuccess => when(
        success: (_) => true,
        error: (_, __) => false,
      );
}
