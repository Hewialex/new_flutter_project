String getFormattedName(String name) {
  List<String> nameParts = name.split(' ');
  if (nameParts.length > 1) {
    return '${nameParts[0]} ${nameParts[1][0]}.';
  } else {
    return nameParts[0];
  }
}
