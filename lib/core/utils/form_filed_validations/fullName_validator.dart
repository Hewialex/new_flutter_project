String? validateFullName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Full Name is required';
  }
  if (value.length > 50) {
    return 'Full Name must be less than 50 characters';
  }
  return null;
}
