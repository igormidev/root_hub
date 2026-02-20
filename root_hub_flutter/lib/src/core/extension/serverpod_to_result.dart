import 'dart:async';

import 'package:result_dart/result_dart.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/utils/talker.dart';
import 'package:root_hub_flutter/src/design_system/default_error_snackbar.dart';

extension FutureServerpodToResultExt<T extends Object> on Future<T> {
  AsyncResultDart<T, RootHubException> get toResult async {
    try {
      return Success(await this);
    } on RootHubException catch (e, stackTrace) {
      talker.handle(e, stackTrace);
      return Failure(e);
    } catch (e, stackTrace) {
      talker.handle(e, stackTrace);
      return Failure(defaultException);
    }
  }
}

extension FutureServerpodToResultVoidExt on Future<void> {
  AsyncResultDart<void, RootHubException> get toResult async {
    try {
      await this;
      return const Success(Unit);
    } on RootHubException catch (e, stackTrace) {
      talker.handle(e, stackTrace);
      return Failure(e);
    } catch (e, stackTrace) {
      talker.handle(e, stackTrace);
      return Failure(defaultException);
    }
  }
}

extension StreamServerpodToResultExt<T> on Stream<T> {
  Future<void> toResult(
    FutureOr<void> Function(T item) onItemEmitted,
    FutureOr<void> Function(RootHubException error) onError,
  ) async {
    try {
      await for (final item in this) {
        await onItemEmitted(item);
      }
    } on RootHubException catch (e, stackTrace) {
      talker.handle(e, stackTrace);
      await onError(e);
    } catch (e, stackTrace) {
      talker.handle(e, stackTrace);
      await onError(defaultException);
    }
  }

  Future<void> toRawResult(
    FutureOr<void> Function(Stream<T> item) onStream,
    FutureOr<void> Function(RootHubException error) onError,
  ) async {
    try {
      await onStream(this);
    } on RootHubException catch (e, stackTrace) {
      talker.handle(e, stackTrace);
      await onError(e);
    } catch (e, stackTrace) {
      talker.handle(e, stackTrace);
      await onError(defaultException);
    }
  }
}

extension StreamServerpodToResultVoidExt on Stream<void> {
  AsyncResultDart<void, RootHubException> get toResult async {
    try {
      this;
      return const Success(Unit);
    } on RootHubException catch (e, stackTrace) {
      talker.handle(e, stackTrace);
      return Failure(e);
    } catch (e, stackTrace) {
      talker.handle(e, stackTrace);
      return Failure(defaultException);
    }
  }
}
