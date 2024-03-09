/// Represents a frequently asked question item.
class FAQItem {
  /// The question of the FAQ item.
  final String question;

  /// The answer to the FAQ item.
  final String answer;

  /// Indicates whether the FAQ item is expanded or not.
  bool isExpanded;

  /// Constructs a new [FAQItem] instance.
  ///
  /// The [question] and [answer] parameters are required.
  /// The [isExpanded] parameter is optional and defaults to `false`.
  FAQItem({
    required this.question,
    required this.answer,
    this.isExpanded = false,
  });
}
