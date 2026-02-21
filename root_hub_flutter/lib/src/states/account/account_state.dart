import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:root_hub_client/root_hub_client.dart';

part 'account_state.freezed.dart';

@freezed
abstract class AccountState with _$AccountState {
  factory AccountState.initial() = _AccountStateWithInitial;
  factory AccountState.loading() = _AccountStateLoading;
  factory AccountState.withError({
    required RootHubException exception,
  }) = _AccountStateWithError;
  factory AccountState.withData({
    required PlayerData accountInfo,
  }) = AccountStateWithData;
}
