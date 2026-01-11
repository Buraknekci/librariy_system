class Book {
  final String id;
  final String title;
  final String author;
  final String description;
  final String imageUrl;
  final String category;
  bool isAvailable;
  DateTime? borrowDate;
  DateTime? dueDate;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.imageUrl,
    required this.category,
    this.isAvailable = true,
    this.borrowDate,
    this.dueDate,
  });
}
