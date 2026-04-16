import 'package:qyra_app/auth/auth_service.dart';

/// ViewModel responsible for the business logic of the HomePage.
/// Handles data formatting and communication with services.
class HomeViewModel {
  // AuthService instance
  final AuthService _authService = AuthService();

  /// Fetches the user's email, extracts the username before the '@',
  /// and capitalizes the first letter. Returns 'Usuário' as fallback.
  String getFormattedUsername() {
    final String? email = _authService.getCurrentUserEmail();

    // If email exists
    if (email != null) {
      // Cut until "@" appears
      final String rawName = email.split('@')[0];

      // First letter in upper case
      return rawName[0].toUpperCase() + rawName.substring(1).toLowerCase();
    }

    // Security fallback if something wents wrong
    return 'Usuário';
  }
}