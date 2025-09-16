String getInitials(String name) {
  List<String> nameParts = name.split(' ');
  String initials = '';

  for (var part in nameParts) {
    if (part.isNotEmpty) {
      initials += part[0];
    }
  }

  return initials;
}
