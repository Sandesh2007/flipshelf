import '../models/book.dart';

class BookService {
  // Singleton pattern
  static final BookService _instance = BookService._internal();
  factory BookService() => _instance;
  BookService._internal();

  // In-memory cache of books
  final Map<String, Book> _books = {};

  // Method to fetch book by ID
  Future<Book?> getBookById(String id) async {
    // If book is in cache, return it
    if (_books.containsKey(id)) {
      return _books[id];
    }

    // TODO: Implement API call or database query here
    // For now, return null if book not found
    return null;
  }

  // Method to add or update book in cache
  void updateBook(Book book) {
    _books[book.id] = book;
  }
}