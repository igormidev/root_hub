import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/global_providers/session_provider.dart';
import 'package:root_hub_flutter/src/core/utils/talker.dart';
import 'package:root_hub_flutter/src/design_system/default_error_snackbar.dart';
import 'package:root_hub_flutter/src/states/account/account_state.dart';

/// Notifier for managing account state.
/// Migrated from StateNotifierProvider to NotifierProvider for Riverpod 3.0.
class AccountStateNotifier extends Notifier<AccountState> {
  int? scrappableIdToBeAttached;

  @override
  AccountState build() => AccountState.initial();

  void logOut() async {
    state = AccountState.initial();
  }

  Future<void> getAccountInfo({bool force = false}) async {
    final isAlreadyWithData = state.maybeWhen(
      withData: (_) => true,
      orElse: () => false,
    );
    if (isAlreadyWithData && force == false) {
      return;
    }

    state = AccountState.loading();

    try {
      final accountInfo = await ref.read(clientProvider).getAccount.v1();

      scrappableIdToBeAttached = null;
      if (accountInfo == null) {
        state = AccountState.initial();
        return;
      }

      state = AccountState.withData(accountInfo: accountInfo);
    } on RootHubException catch (e, stackTrace) {
      talker.handle(e, stackTrace);
      state = AccountState.withError(exception: e);
    } catch (e, stackTrace) {
      talker.handle(e, stackTrace);
      state = AccountState.withError(exception: defaultException);
    }
  }

  void setUser(PlayerData accountInfo) {
    state = AccountState.withData(accountInfo: accountInfo);
  }
}

final accountProvider = NotifierProvider<AccountStateNotifier, AccountState>(
  AccountStateNotifier.new,
);
