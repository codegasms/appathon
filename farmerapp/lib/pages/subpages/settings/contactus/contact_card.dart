/// Represents a contact card with information about a person.
class ContactCard {
  final String name;
  final String role;
  final String githubUrl;
  final String linkedinUrl;

  /// Creates a new instance of [ContactCard] with the given parameters.
  ContactCard({
    required this.name,
    required this.role,
    required this.githubUrl,
    required this.linkedinUrl,
  });
}
