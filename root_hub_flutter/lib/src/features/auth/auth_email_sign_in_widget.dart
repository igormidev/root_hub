import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import 'package:serverpod_auth_idp_flutter/widgets.dart';

class AuthEmailSignInWidget extends StatefulWidget {
  const AuthEmailSignInWidget({
    super.key,
    required this.client,
    required this.onAuthenticated,
    this.onError,
  });

  final Client client;
  final VoidCallback onAuthenticated;
  final void Function(Object error)? onError;

  @override
  State<AuthEmailSignInWidget> createState() => _AuthEmailSignInWidgetState();
}

class _AuthEmailSignInWidgetState extends State<AuthEmailSignInWidget> {
  static const _verificationCodeConfig = VerificationCodeConfig();
  static final _uppercaseRegex = RegExp(r'[A-Z]');
  static final _lowercaseRegex = RegExp(r'[a-z]');
  static final _numberRegex = RegExp(r'[0-9]');

  late final EmailAuthController _controller;

  Timer? _resendCountdownTimer;
  EmailFlowScreen? _lastKnownScreen;
  Object? _lastHandledError;
  int _remainingResendSeconds = 0;

  @override
  void initState() {
    super.initState();
    _controller = EmailAuthController(
      client: widget.client,
      startScreen: EmailFlowScreen.login,
      onAuthenticated: widget.onAuthenticated,
    )..addListener(_onControllerChanged);
    _lastKnownScreen = _controller.currentScreen;
  }

  @override
  void dispose() {
    _resendCountdownTimer?.cancel();
    _controller
      ..removeListener(_onControllerChanged)
      ..dispose();
    super.dispose();
  }

  void _onControllerChanged() {
    final currentScreen = _controller.currentScreen;
    final previousScreen = _lastKnownScreen;

    if (currentScreen != previousScreen) {
      if (_isVerificationScreen(currentScreen)) {
        _startResendCountdown();
      } else {
        _clearResendCountdown();
      }
      _lastKnownScreen = currentScreen;
    }

    if (_controller.state == EmailAuthState.error) {
      final error = _controller.error;
      if (error != null && !identical(error, _lastHandledError)) {
        _lastHandledError = error;
        widget.onError?.call(error);
        final errorMessage = _resolveErrorMessage(error);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) {
            return;
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errorMessage)),
          );
        });
      }
    } else {
      _lastHandledError = null;
    }

    if (!mounted) {
      return;
    }

    setState(() {});
  }

  bool _isVerificationScreen(EmailFlowScreen screen) {
    return screen == EmailFlowScreen.verifyRegistration ||
        screen == EmailFlowScreen.verifyPasswordReset;
  }

  void _startResendCountdown() {
    _resendCountdownTimer?.cancel();
    _remainingResendSeconds =
        _verificationCodeConfig.resendCountdownDuration.inSeconds;
    _resendCountdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      if (_remainingResendSeconds <= 0) {
        timer.cancel();
        return;
      }

      setState(() {
        _remainingResendSeconds--;
      });
    });
  }

  void _clearResendCountdown() {
    _resendCountdownTimer?.cancel();
    _remainingResendSeconds = 0;
  }

  bool _passwordHasMinimumLength(String password) {
    return password.length >= 8;
  }

  bool _passwordHasUppercase(String password) {
    return _uppercaseRegex.hasMatch(password);
  }

  bool _passwordHasLowercase(String password) {
    return _lowercaseRegex.hasMatch(password);
  }

  bool _passwordHasNumber(String password) {
    return _numberRegex.hasMatch(password);
  }

  bool _isPasswordValid(String password) {
    return _passwordHasMinimumLength(password) &&
        _passwordHasUppercase(password) &&
        _passwordHasLowercase(password) &&
        _passwordHasNumber(password);
  }

  String _formatResendTime(int totalSeconds) {
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  String _resolveErrorMessage(Object error) {
    final errorsT = context.t.auth.auth_login_screen.errors;

    if (error is InvalidEmailException) {
      return errorsT.invalidEmail;
    }

    if (error is EmailAccountLoginException) {
      return switch (error.reason) {
        EmailAccountLoginExceptionReason.invalidCredentials =>
          errorsT.invalidCredentials,
        EmailAccountLoginExceptionReason.tooManyAttempts =>
          errorsT.tooManyLoginAttempts,
        EmailAccountLoginExceptionReason.unknown => errorsT.loginFailed,
      };
    }

    if (error is EmailAccountRequestException) {
      return switch (error.reason) {
        EmailAccountRequestExceptionReason.tooManyAttempts =>
          errorsT.tooManyRegistrationAttempts,
        EmailAccountRequestExceptionReason.expired =>
          errorsT.verificationCodeExpired,
        EmailAccountRequestExceptionReason.invalid =>
          errorsT.invalidVerificationCode,
        EmailAccountRequestExceptionReason.policyViolation =>
          errorsT.passwordPolicyViolation,
        EmailAccountRequestExceptionReason.unknown =>
          errorsT.registrationFailed,
      };
    }

    if (error is EmailAccountPasswordResetException) {
      return switch (error.reason) {
        EmailAccountPasswordResetExceptionReason.tooManyAttempts =>
          errorsT.tooManyPasswordResetAttempts,
        EmailAccountPasswordResetExceptionReason.expired =>
          errorsT.verificationCodeExpired,
        EmailAccountPasswordResetExceptionReason.invalid =>
          errorsT.invalidVerificationCode,
        EmailAccountPasswordResetExceptionReason.policyViolation =>
          errorsT.passwordPolicyViolation,
        EmailAccountPasswordResetExceptionReason.unknown =>
          errorsT.passwordResetFailed,
      };
    }

    if (error is ServerpodClientException && error.statusCode == -1) {
      return errorsT.networkUnavailable;
    }

    return errorsT.unexpected;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final authT = context.t.auth.auth_login_screen;
    final currentScreen = _controller.currentScreen;
    final isLoading = _controller.isLoading;
    final email = _controller.emailController.text.trim();
    final password = _controller.passwordController.text;
    final code = _controller.verificationCodeController.text.trim();
    final passwordIsValid = _isPasswordValid(password);
    final verificationCodeComplete =
        code.length == _verificationCodeConfig.length;

    final emailErrorText = _controller.error is InvalidEmailException
        ? authT.errors.invalidEmail
        : null;

    final form = switch (currentScreen) {
      EmailFlowScreen.login => FormStandardLayout(
        title: authT.signInWithEmailTitle,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              controller: _controller.emailController,
              labelText: authT.emailLabel,
              keyboardType: TextInputType.emailAddress,
              isLoading: isLoading,
              errorText: emailErrorText,
              inputFormatters: [
                FilteringTextInputFormatter.deny(
                  RegExp(r'[\s()<>[\]\\,;:]'),
                ),
              ],
            ),
            smallGap,
            PasswordField(
              controller: _controller.passwordController,
              isLoading: isLoading,
              labelText: authT.passwordLabel,
            ),
            tinyGap,
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: isLoading
                    ? null
                    : () => _controller.navigateTo(
                        EmailFlowScreen.requestPasswordReset,
                      ),
                child: Text(authT.forgotPasswordButton),
              ),
            ),
          ],
        ),
        actionButton: ActionButton(
          onPressed: email.isNotEmpty && password.isNotEmpty && !isLoading
              ? () => unawaited(_controller.login())
              : null,
          label: authT.signInButton,
          isLoading: isLoading,
        ),
        bottomText: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(authT.dontHaveAnAccount),
            SizedBox(width: 4),
            HyperlinkTextButton(
              onPressed: () =>
                  _controller.navigateTo(EmailFlowScreen.startRegistration),
              label: authT.signUpLink,
            ),
          ],
        ),
      ),
      EmailFlowScreen.startRegistration => FormStandardLayout(
        title: authT.signUpWithEmailTitle,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              controller: _controller.emailController,
              labelText: authT.emailLabel,
              keyboardType: TextInputType.emailAddress,
              isLoading: isLoading,
              errorText: emailErrorText,
              inputFormatters: [
                FilteringTextInputFormatter.deny(
                  RegExp(r'[\s()<>[\]\\,;:]'),
                ),
              ],
            ),
          ],
        ),
        actionButton: ActionButton(
          onPressed: email.isNotEmpty && !isLoading
              ? () => unawaited(_controller.startRegistration())
              : null,
          label: authT.continueButton,
          isLoading: isLoading,
        ),
        bottomText: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(authT.alreadyHaveAnAccount),
            HyperlinkTextButton(
              onPressed: () => _controller.navigateTo(EmailFlowScreen.login),
              label: authT.signInLink,
            ),
          ],
        ),
      ),
      EmailFlowScreen.verifyRegistration => FormStandardLayout(
        title: authT.verifyAccountTitle,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              authT.verifyAccountMessage,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            smallGap,
            VerificationCodeInput(
              verificationCodeController:
                  _controller.verificationCodeController,
              onCompleted: () =>
                  unawaited(_controller.verifyRegistrationCode()),
              isLoading: isLoading,
              length: _verificationCodeConfig.length,
              keyboardType: _verificationCodeConfig.keyboardType,
              allowedLetterCase: _verificationCodeConfig.allowedLetterCase,
              allowedCharactersPattern:
                  _verificationCodeConfig.allowedCharactersPattern ??
                  RegExp(r'[1-9]'),
            ),
            tinyGap,
            TextButton(
              onPressed: _remainingResendSeconds == 0 && !isLoading
                  ? () async {
                      await _controller.resendVerificationCode();
                      if (!mounted) {
                        return;
                      }
                      if (_controller.state != EmailAuthState.error) {
                        _startResendCountdown();
                      }
                    }
                  : null,
              child: Text(
                _remainingResendSeconds > 0
                    ? authT.resendCodeIn(
                        time: _formatResendTime(_remainingResendSeconds),
                      )
                    : authT.resendCode,
              ),
            ),
          ],
        ),
        actionButton: ActionButton(
          onPressed: verificationCodeComplete && !isLoading
              ? () => unawaited(_controller.verifyRegistrationCode())
              : null,
          label: authT.verifyButton,
          isLoading: isLoading,
        ),
        bottomText: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HyperlinkTextButton(
              onPressed: () => _controller.navigateTo(EmailFlowScreen.login),
              label: authT.backToSignIn,
            ),
          ],
        ),
      ),
      EmailFlowScreen.completeRegistration => FormStandardLayout(
        title: authT.setAccountPasswordTitle,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PasswordField(
              controller: _controller.passwordController,
              isLoading: isLoading,
              labelText: authT.passwordLabel,
            ),
            smallGap,
            Row(
              children: [
                Icon(
                  _passwordHasMinimumLength(password)
                      ? Icons.check_circle
                      : Icons.cancel,
                  size: 16,
                  color: _passwordHasMinimumLength(password)
                      ? colorScheme.primary
                      : colorScheme.outline,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    authT.passwordRuleMinLength,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  _passwordHasUppercase(password)
                      ? Icons.check_circle
                      : Icons.cancel,
                  size: 16,
                  color: _passwordHasUppercase(password)
                      ? colorScheme.primary
                      : colorScheme.outline,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    authT.passwordRuleUppercase,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  _passwordHasLowercase(password)
                      ? Icons.check_circle
                      : Icons.cancel,
                  size: 16,
                  color: _passwordHasLowercase(password)
                      ? colorScheme.primary
                      : colorScheme.outline,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    authT.passwordRuleLowercase,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  _passwordHasNumber(password)
                      ? Icons.check_circle
                      : Icons.cancel,
                  size: 16,
                  color: _passwordHasNumber(password)
                      ? colorScheme.primary
                      : colorScheme.outline,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    authT.passwordRuleNumber,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ],
        ),
        actionButton: ActionButton(
          onPressed: passwordIsValid && !isLoading
              ? () => unawaited(_controller.finishRegistration())
              : null,
          label: authT.signUpButton,
          isLoading: isLoading,
        ),
        bottomText: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HyperlinkTextButton(
              onPressed: () => _controller.navigateTo(EmailFlowScreen.login),
              label: authT.backToSignIn,
            ),
          ],
        ),
      ),
      EmailFlowScreen.requestPasswordReset => FormStandardLayout(
        title: authT.resetPasswordTitle,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              authT.requestResetDescription,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            smallGap,
            CustomTextField(
              controller: _controller.emailController,
              labelText: authT.emailLabel,
              keyboardType: TextInputType.emailAddress,
              isLoading: isLoading,
              errorText: emailErrorText,
              inputFormatters: [
                FilteringTextInputFormatter.deny(
                  RegExp(r'[\s()<>[\]\\,;:]'),
                ),
              ],
            ),
          ],
        ),
        actionButton: ActionButton(
          onPressed: email.isNotEmpty && !isLoading
              ? () => unawaited(_controller.startPasswordReset())
              : null,
          label: authT.requestResetButton,
          isLoading: isLoading,
        ),
        bottomText: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HyperlinkTextButton(
              onPressed: () => _controller.navigateTo(EmailFlowScreen.login),
              label: authT.backToSignIn,
            ),
          ],
        ),
      ),
      EmailFlowScreen.verifyPasswordReset => FormStandardLayout(
        title: authT.verifyResetCodeTitle,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              authT.verifyResetMessage,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            smallGap,
            VerificationCodeInput(
              verificationCodeController:
                  _controller.verificationCodeController,
              onCompleted: () =>
                  unawaited(_controller.verifyPasswordResetCode()),
              isLoading: isLoading,
              length: _verificationCodeConfig.length,
              keyboardType: _verificationCodeConfig.keyboardType,
              allowedLetterCase: _verificationCodeConfig.allowedLetterCase,
              allowedCharactersPattern:
                  _verificationCodeConfig.allowedCharactersPattern ??
                  RegExp(r'[1-9]'),
            ),
            tinyGap,
            TextButton(
              onPressed: _remainingResendSeconds == 0 && !isLoading
                  ? () async {
                      await _controller.resendVerificationCode();
                      if (!mounted) {
                        return;
                      }
                      if (_controller.state != EmailAuthState.error) {
                        _startResendCountdown();
                      }
                    }
                  : null,
              child: Text(
                _remainingResendSeconds > 0
                    ? authT.resendCodeIn(
                        time: _formatResendTime(_remainingResendSeconds),
                      )
                    : authT.resendCode,
              ),
            ),
          ],
        ),
        actionButton: ActionButton(
          onPressed: verificationCodeComplete && !isLoading
              ? () => unawaited(_controller.verifyPasswordResetCode())
              : null,
          label: authT.verifyButton,
          isLoading: isLoading,
        ),
        bottomText: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HyperlinkTextButton(
              onPressed: () => _controller.navigateTo(EmailFlowScreen.login),
              label: authT.backToSignIn,
            ),
          ],
        ),
      ),
      EmailFlowScreen.completePasswordReset => FormStandardLayout(
        title: authT.setNewPasswordTitle,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PasswordField(
              controller: _controller.passwordController,
              isLoading: isLoading,
              labelText: authT.newPasswordLabel,
            ),
            smallGap,
            Row(
              children: [
                Icon(
                  _passwordHasMinimumLength(password)
                      ? Icons.check_circle
                      : Icons.cancel,
                  size: 16,
                  color: _passwordHasMinimumLength(password)
                      ? colorScheme.primary
                      : colorScheme.outline,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    authT.passwordRuleMinLength,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  _passwordHasUppercase(password)
                      ? Icons.check_circle
                      : Icons.cancel,
                  size: 16,
                  color: _passwordHasUppercase(password)
                      ? colorScheme.primary
                      : colorScheme.outline,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    authT.passwordRuleUppercase,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  _passwordHasLowercase(password)
                      ? Icons.check_circle
                      : Icons.cancel,
                  size: 16,
                  color: _passwordHasLowercase(password)
                      ? colorScheme.primary
                      : colorScheme.outline,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    authT.passwordRuleLowercase,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  _passwordHasNumber(password)
                      ? Icons.check_circle
                      : Icons.cancel,
                  size: 16,
                  color: _passwordHasNumber(password)
                      ? colorScheme.primary
                      : colorScheme.outline,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    authT.passwordRuleNumber,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ],
        ),
        actionButton: ActionButton(
          onPressed: passwordIsValid && !isLoading
              ? () => unawaited(_controller.finishPasswordReset())
              : null,
          label: authT.resetPasswordButton,
          isLoading: isLoading,
        ),
        bottomText: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HyperlinkTextButton(
              onPressed: () => _controller.navigateTo(EmailFlowScreen.login),
              label: authT.backToSignIn,
            ),
          ],
        ),
      ),
    };

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 280),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      transitionBuilder: (child, animation) {
        final slide = Tween<Offset>(
          begin: const Offset(0.06, 0),
          end: Offset.zero,
        ).animate(animation);
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(position: slide, child: child),
        );
      },
      child: Padding(
        key: ValueKey<EmailFlowScreen>(currentScreen),
        padding: const EdgeInsets.all(20),
        child: form,
      ),
    );
  }
}
