/// Represents allowed credentials for a public key credential login operation.
class AllowCredential {
  /// The identifier of the allowed credential.
  final String id;

  /// The type of the allowed credential.
  final String type;

  /// Constructs a new [AllowCredential] instance.
  ///
  /// [id] is the identifier of the allowed credential.
  /// [type] is the type of the allowed credential.
  AllowCredential({
    required this.id,
    required this.type,
  });

  /// Constructs a [AllowCredential] instance from a JSON object.
  ///
  /// The JSON object must contain the following keys:
  /// - "id": The identifier of the allowed credential.
  /// - "type": The type of the allowed credential.
  factory AllowCredential.fromJson(Map<String, dynamic> json) {
    return AllowCredential(
      id: json['id'],
      type: json['type'],
    );
  }

  /// Converts this [AllowCredential] instance to a JSON object.
  ///
  /// Returns a JSON object containing the following keys:
  /// - "id": The identifier of the allowed credential.
  /// - "type": The type of the allowed credential.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
    };
  }
}

/// Represents options for credential login.
class CredentialLoginOptions {
  /// A challenge that the authenticator must complete.
  final String challenge;

  /// The relying party identifier.
  final String rpId;

  /// Specifies whether user verification is required or preferred.
  final String userVerification;

  /// The allowed credentials.
  final List<AllowCredential> allowCredentials;

  /// The time, in milliseconds, allowed for the user to complete the operation.
  /// Defaults to 30 minutes (1800000 milliseconds).
  final int timeout;

  //only available on ios
  final bool conditionalUI;

  /// Constructs a new [CredentialLoginOptions] instance.
  ///
  /// [challenge] is the challenge that the authenticator must complete.
  /// [rpId] is the relying party identifier.
  /// [userVerification] specifies whether user verification is required or preferred.
  /// [allowCredentials] are the allowed credentials.
  /// [timeout] is the time, in milliseconds, allowed for the user to complete the operation.
  /// Defaults to 30 minutes (1800000 milliseconds).
  CredentialLoginOptions({
    required this.challenge,
    required this.rpId,
    required this.userVerification,
    required this.allowCredentials,
    this.timeout = 1800000,
    this.conditionalUI = false,
  });

  /// Constructs a [CredentialLoginOptions] instance from a JSON object.
  ///
  /// The JSON object must contain the following keys:
  /// - "challenge": A challenge that the authenticator must complete.
  /// - "rpId": The relying party identifier.
  /// - "userVerification": Specifies whether user verification is required or preferred.
  /// - "allowCredentials": The allowed credentials.
  /// - "timeout": (Optional) The time, in milliseconds, allowed for the user to complete the operation.
  ///   Defaults to 30 minutes (1800000 milliseconds).
  factory CredentialLoginOptions.fromJson(Map<String, dynamic> json) {
    return CredentialLoginOptions(
      challenge: json['challenge'],
      rpId: json['rpId'],
      userVerification: json['userVerification'],
      allowCredentials: json['allowCredentials'] != null
          ? (json['allowCredentials'] as List)
              .map((i) => AllowCredential.fromJson(i))
              .toList()
          : [],
      timeout: json['timeout'] ?? 1800000,
      conditionalUI: json['conditionalUI'] ?? false,
    );
  }

  /// Converts this [CredentialLoginOptions] instance to a JSON object.
  ///
  /// Returns a JSON object containing the following keys:
  /// - "challenge": A challenge that the authenticator must complete.
  /// - "rpId": The relying party identifier.
  /// - "userVerification": Specifies whether user verification is required or preferred.
  /// - "allowCredentials": The allowed credentials.
  /// - "timeout": The time, in milliseconds, allowed for the user to complete the operation.
  Map<String, dynamic> toJson() {
    return {
      'challenge': challenge,
      'rpId': rpId,
      'userVerification': userVerification,
      'allowCredentials': allowCredentials.map((i) => i.toJson()).toList(),
      'timeout': timeout,
      'conditionalUI': conditionalUI,
    };
  }
}
