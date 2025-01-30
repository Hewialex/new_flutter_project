String? validatePassword(var value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  }
  if (value.length < 8) {
    return 'Password must be at least 8 characters';
  }
  if (value.length > 32) {
    return 'Password must not exceed 16 characters';
  }
  return null;
}
