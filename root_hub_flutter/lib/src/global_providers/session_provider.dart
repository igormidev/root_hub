
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

final clientProvider = Provider<Client>((ref) {
  return throw UnimplementedError();
});

/// Provider for accessing the FlutterAuthSessionManager from the client.
final sessionManagerProvider = Provider<FlutterAuthSessionManager>((ref) {
  final client = ref.watch(clientProvider);
  return client.authSessionManager;
});