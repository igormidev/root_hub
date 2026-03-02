import 'package:freezed_annotation/freezed_annotation.dart';

part 'deep_link_state.freezed.dart';

@freezed
abstract class DeepLinkState with _$DeepLinkState {
  const factory DeepLinkState({
    @Default(false) bool isInitialized,
    int? pendingMatchId,
    Uri? lastReceivedUri,
  }) = _DeepLinkState;
}
