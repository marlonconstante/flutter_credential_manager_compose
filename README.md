# Flutter Credential Manager
![Android](https://img.shields.io/badge/Platforms-Android-green)
![iOS](https://img.shields.io/badge/Platforms-iOS-blue)

[Credential Manager](https://developer.android.com/jetpack/androidx/releases/credentials) is a Jetpack API that supports multiple sign-in methods, such as username and password, passkeys, and federated sign-in solutions (like Sign-in with Google) in a single API, simplifying integration for developers on Android. For iOS, it uses Keychain for storing credentials.

For users, Credential Manager unifies the sign-in interface across authentication methods, making it clearer and easier to sign into apps, regardless of the chosen method.

For iOS, it uses [Keychain](https://developer.apple.com/documentation/security/keychain_services) and [Autofill](https://developer.apple.com/documentation/uikit/text_input/adding_password_autofill_support_to_your_app).

For more information, please refer to the [official documentation](https://developer.android.com/jetpack/androidx/releases/credentials).

## Getting Started

Add the dependency to your pubspec.yaml file:

```yaml
flutter_credential_manager: <latest_version>
```

Or run:

```bash
flutter pub add flutter_credential_manager
```
