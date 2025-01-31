String? confirmPasswordValidator(String? value, String? Password) {
  if (value == null || value.isEmpty) {
    return 'Please confirm your password';
  }
  if (Password == null) {
    return 'Please enter your password';
  }
  if (value != Password) {
    return 'Passwords do not match';
  }
  return null;
}
