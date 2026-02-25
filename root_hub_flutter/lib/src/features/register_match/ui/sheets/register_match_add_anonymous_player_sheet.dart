import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/design_system/default_error_snackbar.dart';
import 'package:root_hub_flutter/src/states/register_match/register_match_provider.dart';

class RegisterMatchAddAnonymousPlayerSheet extends ConsumerStatefulWidget {
  const RegisterMatchAddAnonymousPlayerSheet({
    super.key,
    required this.activeAnonymousPlayerIds,
  });

  final Set<int> activeAnonymousPlayerIds;

  static Future<AnonymousPlayer?> show(
    BuildContext context, {
    required Set<int> activeAnonymousPlayerIds,
  }) {
    return showModalBottomSheet<AnonymousPlayer>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) {
        return RegisterMatchAddAnonymousPlayerSheet(
          activeAnonymousPlayerIds: activeAnonymousPlayerIds,
        );
      },
    );
  }

  @override
  ConsumerState<RegisterMatchAddAnonymousPlayerSheet> createState() =>
      _RegisterMatchAddAnonymousPlayerSheetState();
}

class _RegisterMatchAddAnonymousPlayerSheetState
    extends ConsumerState<RegisterMatchAddAnonymousPlayerSheet> {
  static const _minNameLength = 3;

  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;

  bool _isCreatingPlayer = false;
  String? _inlineError;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();

    Future<void>.microtask(() async {
      await ref
          .read(registerMatchProvider.notifier)
          .ensureAnonymousPlayersLoaded();
    });
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  Future<void> _createAnonymousPlayer() async {
    if (_isCreatingPlayer) {
      return;
    }

    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();

    if (firstName.length < _minNameLength || lastName.length < _minNameLength) {
      setState(() {
        _inlineError =
            'First name and last name must have at least $_minNameLength characters.';
      });
      return;
    }

    setState(() {
      _inlineError = null;
      _isCreatingPlayer = true;
    });

    final createdPlayer = await ref
        .read(registerMatchProvider.notifier)
        .createAnonymousPlayer(
          firstName: firstName,
          lastName: lastName,
        );

    if (!mounted) {
      return;
    }

    if (createdPlayer == null) {
      final error = ref.read(registerMatchProvider).anonymousPlayersError;
      setState(() {
        _isCreatingPlayer = false;
        _inlineError = (error ?? defaultException).description;
      });
      return;
    }

    Navigator.of(context).pop(createdPlayer);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final registerState = ref.watch(registerMatchProvider);
    final anonymousPlayers = registerState.anonymousPlayers;
    final isLoading =
        registerState.isLoadingAnonymousPlayers && anonymousPlayers.isEmpty;

    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.74,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
                child: Text(
                  'Add anonymous player',
                  style:
                      Theme.of(
                        context,
                      ).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                child: Column(
                  children: [
                    TextField(
                      controller: _firstNameController,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'First name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _lastNameController,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        labelText: 'Last name',
                        border: OutlineInputBorder(),
                      ),
                      onSubmitted: (_) => _createAnonymousPlayer(),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: _isCreatingPlayer
                            ? null
                            : _createAnonymousPlayer,
                        child: _isCreatingPlayer
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text('Create and add player'),
                      ),
                    ),
                    if (_inlineError != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          _inlineError!,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: colorScheme.error,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ),
                  ],
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : anonymousPlayers.isEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'No anonymous players yet. Create one using first and last name.',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: anonymousPlayers.length,
                        itemBuilder: (context, index) {
                          final anonymousPlayer = anonymousPlayers[index];
                          final playerId = anonymousPlayer.id;
                          final alreadyAdded =
                              playerId != null &&
                              widget.activeAnonymousPlayerIds.contains(
                                playerId,
                              );

                          return ListTile(
                            leading: const Icon(Icons.person_outline_rounded),
                            title: Text(_anonymousPlayerName(anonymousPlayer)),
                            subtitle: Text(
                              alreadyAdded
                                  ? 'Already added to this report'
                                  : 'Tap to add',
                            ),
                            enabled: !alreadyAdded,
                            onTap: alreadyAdded || playerId == null
                                ? null
                                : () {
                                    Navigator.of(context).pop(anonymousPlayer);
                                  },
                          );
                        },
                      ),
              ),
              const SizedBox(height: 6),
            ],
          ),
        ),
      ),
    );
  }

  String _anonymousPlayerName(AnonymousPlayer anonymousPlayer) {
    final firstName = anonymousPlayer.firstName.trim();
    final lastName = anonymousPlayer.lastName.trim();
    final combinedName = '$firstName $lastName'.trim();

    if (combinedName.isNotEmpty) {
      return combinedName;
    }

    return 'Anonymous Player';
  }
}
