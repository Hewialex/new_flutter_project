String? validatePassword(var value) {
  if (value!.isEmpty) {
    // TODO: Add more password validation here for a
    // better user experience
    return 'Please enter your password';
  }
  return null;
}
