class User {
  final String id;
  final String name;
  final String email;
  final List<String> borrowedBookIds;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.borrowedBookIds,
  });

  User copyWith({
    String? id,
    String? name,
    String? email,
    List<String>? borrowedBookIds,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      borrowedBookIds: borrowedBookIds ?? this.borrowedBookIds,
    );
  }
}
