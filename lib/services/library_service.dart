import 'dart:async';
import '../models/book.dart';

class LibraryService {
  static final LibraryService _instance = LibraryService._internal();
  factory LibraryService() => _instance;
  LibraryService._internal();

  final _booksController = StreamController<List<Book>>.broadcast();
  Stream<List<Book>> get booksStream => _booksController.stream;

  final List<Book> _books = [
    Book(
      id: '1',
      title: 'The Great Gatsby',
      author: 'F. Scott Fitzgerald',
      category: 'Classic',
      description: 'A story of ambition and love in the 1920s.',
      imageUrl: 'https://images.unsplash.com/photo-1544947950-fa07a98d237f?auto=format&fit=crop&q=80&w=200',
    ),
    Book(
      id: '2',
      title: '1984',
      author: 'George Orwell',
      category: 'Sci-Fi',
      description: 'A dystopian novel about total surveillance.',
      imageUrl: 'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?auto=format&fit=crop&q=80&w=200',
    ),
    Book(
      id: '3',
      title: 'To Kill a Mockingbird',
      author: 'Harper Lee',
      category: 'Classic',
      description: 'A story of racial injustice in the American South.',
      imageUrl: 'https://images.unsplash.com/photo-1512820790803-83ca734da794?auto=format&fit=crop&q=80&w=200',
    ),
    Book(
      id: '4',
      title: 'The Hobbit',
      author: 'J.R.R. Tolkien',
      category: 'Fantasy',
      description: 'The journey of Bilbo Baggins.',
      imageUrl: 'https://images.unsplash.com/photo-1621351123083-b882da70df64?auto=format&fit=crop&q=80&w=200',
    ),
    Book(
      id: '5',
      title: 'Brave New World',
      author: 'Aldous Huxley',
      category: 'Sci-Fi',
      description: 'A vision of a futuristic society.',
      imageUrl: 'https://images.unsplash.com/photo-1589998059171-988d887df646?auto=format&fit=crop&q=80&w=200',
    ),
    Book(
      id: '6',
      title: 'Dune',
      author: 'Frank Herbert',
      category: 'Sci-Fi',
      description: 'Epic science fiction set on a desert planet.',
      imageUrl: 'https://images.unsplash.com/photo-1531050171669-01449419351d?auto=format&fit=crop&q=80&w=200',
    ),
    Book(
      id: '7',
      title: 'Pride and Prejudice',
      author: 'Jane Austen',
      category: 'Classic',
      description: 'A romantic novel of manners.',
      imageUrl: 'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?auto=format&fit=crop&q=80&w=200',
    ),
    Book(
      id: '8',
      title: 'The Alchemist',
      author: 'Paulo Coelho',
      category: 'Philosophy',
      description: 'A journey of self-discovery.',
      imageUrl: 'https://images.unsplash.com/photo-1512820790803-83ca734da794?auto=format&fit=crop&q=80&w=200',
    ),
    Book(
      id: '9',
      title: 'Atomic Habits',
      author: 'James Clear',
      category: 'Self-Help',
      description: 'Building good habits and breaking bad ones.',
      imageUrl: 'https://images.unsplash.com/photo-1589829085413-56de8ae18c73?auto=format&fit=crop&q=80&w=200',
    ),
    Book(
      id: '10',
      title: 'Sapiens',
      author: 'Yuval Noah Harari',
      category: 'History',
      description: 'A brief history of humankind.',
      imageUrl: 'https://images.unsplash.com/photo-1544947950-fa07a98d237f?auto=format&fit=crop&q=80&w=200',
    ),
    Book(
      id: '11',
      title: 'The Lord of the Rings',
      author: 'J.R.R. Tolkien',
      category: 'Fantasy',
      description: 'An epic high-fantasy novel.',
      imageUrl: 'https://images.unsplash.com/photo-1618336753974-aae8e04506aa?auto=format&fit=crop&q=80&w=200',
    ),
    Book(
      id: '12',
      title: 'Harry Potter',
      author: 'J.K. Rowling',
      category: 'Fantasy',
      description: 'The boy who lived.',
      imageUrl: 'https://images.unsplash.com/photo-1541963463532-d68292c34b19?auto=format&fit=crop&q=80&w=200',
    ),
    Book(
      id: '13',
      title: 'The Catcher in the Rye',
      author: 'J.D. Salinger',
      category: 'Classic',
      description: 'A story of teenage rebellion.',
      imageUrl: 'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?auto=format&fit=crop&q=80&w=200',
    ),
    Book(
      id: '14',
      title: 'Foundation',
      author: 'Isaac Asimov',
      category: 'Sci-Fi',
      description: 'A galactic empire in decline.',
      imageUrl: 'https://images.unsplash.com/photo-1531050171669-01449419351d?auto=format&fit=crop&q=80&w=200',
    ),
    Book(
      id: '15',
      title: 'Meditations',
      author: 'Marcus Aurelius',
      category: 'Philosophy',
      description: 'Personal reflections of a Roman Emperor.',
      imageUrl: 'https://images.unsplash.com/photo-1512820790803-83ca734da794?auto=format&fit=crop&q=80&w=200',
    ),
    Book(
      id: '16',
      title: 'Psychology of Money',
      author: 'Morgan Housel',
      category: 'Self-Help',
      description: 'Timeless lessons on wealth and greed.',
      imageUrl: 'https://images.unsplash.com/photo-1589829085413-56de8ae18c73?auto=format&fit=crop&q=80&w=200',
    ),
    Book(
      id: '17',
      title: 'Guns, Germs, and Steel',
      author: 'Jared Diamond',
      category: 'History',
      description: 'The fates of human societies.',
      imageUrl: 'https://images.unsplash.com/photo-1544947950-fa07a98d237f?auto=format&fit=crop&q=80&w=200',
    ),
    Book(
      id: '18',
      title: 'Moby Dick',
      author: 'Herman Melville',
      category: 'Classic',
      description: 'The quest for the white whale.',
      imageUrl: 'https://images.unsplash.com/photo-1512820790803-83ca734da794?auto=format&fit=crop&q=80&w=200',
    ),
    Book(
      id: '19',
      title: 'Frankenstein',
      author: 'Mary Shelley',
      category: 'Classic',
      description: 'A scientist creates a sentient creature.',
      imageUrl: 'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?auto=format&fit=crop&q=80&w=200',
    ),
    Book(
      id: '20',
      title: 'The Martian',
      author: 'Andy Weir',
      category: 'Sci-Fi',
      description: 'Stranded on Mars.',
      imageUrl: 'https://images.unsplash.com/photo-1544947950-fa07a98d237f?auto=format&fit=crop&q=80&w=200',
    ),
  ];

  void _notifyListeners() {
    _booksController.add(List.from(_books));
  }

  Future<List<Book>> searchBooks(String query) async {
    await Future.delayed(const Duration(milliseconds: 100));
    if (query.isEmpty) return List.unmodifiable(_books);
    return _books
        .where((book) =>
            book.title.toLowerCase().contains(query.toLowerCase()) ||
            book.author.toLowerCase().contains(query.toLowerCase()) ||
            book.category.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  Future<bool> borrowBook(String bookId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _books.indexWhere((b) => b.id == bookId);
    if (index != -1 && _books[index].isAvailable) {
      _books[index].isAvailable = false;
      _books[index].borrowDate = DateTime.now();
      _books[index].dueDate = DateTime.now().add(const Duration(days: 14));
      _notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> returnBook(String bookId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _books.indexWhere((b) => b.id == bookId);
    if (index != -1 && !_books[index].isAvailable) {
      _books[index].isAvailable = true;
      _books[index].borrowDate = null;
      _books[index].dueDate = null;
      _notifyListeners();
      return true;
    }
    return false;
  }

  void dispose() {
    _booksController.close();
  }
}
