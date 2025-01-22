String? validateUsername(String? value) {
  if (value == null || value.isEmpty) {
    return 'Username is required';
  }
  if (value.length > 15) {
    return 'Username must not exceed 15 characters';
  }
  if (!RegExp(r'^[a-zA-Z0-9_@]+$').hasMatch(value)) {
    return 'Username can only contain letters, numbers, underscores, and @';
  }
  return null;
}
