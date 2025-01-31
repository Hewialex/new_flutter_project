String? validateUsername(String? value) {
  if (value == null || value.isEmpty) {
    return 'Username is required';
  }
  if (value.length > 15) {
    return 'Username must not exceed 15 characters';
  }
  if (!RegExp(r'^[a-zA-Z_]+$').hasMatch(value)) {
    return 'Username can only contain letters and underscores';
  }
  return null;
}
