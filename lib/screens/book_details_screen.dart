import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/book.dart';
import '../services/library_service.dart';

class BookDetailsScreen extends StatefulWidget {
  final Book book;
  const BookDetailsScreen({super.key, required this.book});

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  final LibraryService _libraryService = LibraryService();
  bool _isLoading = false;
  final DateFormat _formatter = DateFormat('MMM dd, yyyy');

  void _handleBorrow() async {
    setState(() => _isLoading = true);
    final success = await _libraryService.borrowBook(widget.book.id);
    setState(() => _isLoading = false);

    if (success) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Book borrowed successfully!')),
        );
        Navigator.pop(context, true);
      }
    }
  }

  void _handleReturn() async {
    setState(() => _isLoading = true);
    final success = await _libraryService.returnBook(widget.book.id);
    setState(() => _isLoading = false);

    if (success) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Book returned successfully!')),
        );
        Navigator.pop(context, true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 350,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'book-${widget.book.id}',
                child: Image.network(
                  widget.book.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.blue.shade100,
                    child: const Icon(Icons.book, size: 100, color: Colors.blue),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          widget.book.category.toUpperCase(),
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        widget.book.isAvailable ? Icons.check_circle : Icons.error,
                        size: 16,
                        color: widget.book.isAvailable ? Colors.green : Colors.red,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        widget.book.isAvailable ? 'Available' : 'Borrowed',
                        style: TextStyle(
                          fontSize: 12,
                          color: widget.book.isAvailable ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.book.title,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'by ${widget.book.author}',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.grey.shade600,
                          fontStyle: FontStyle.italic,
                        ),
                  ),
                  const SizedBox(height: 24),
                  if (!widget.book.isAvailable && widget.book.borrowDate != null) ...[
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.orange.shade200),
                      ),
                      child: Column(
                        children: [
                          _buildDateRow(Icons.calendar_today, 'Borrowed on:', _formatter.format(widget.book.borrowDate!)),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Divider(),
                          ),
                          _buildDateRow(Icons.event_available, 'Return by:', _formatter.format(widget.book.dueDate!), isCritical: true),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                  Text(
                    'About this book',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.book.description,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, -4),
              blurRadius: 12,
            ),
          ],
        ),
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : ElevatedButton(
                  onPressed: widget.book.isAvailable ? _handleBorrow : _handleReturn,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.book.isAvailable ? Colors.blue.shade700 : Colors.orange.shade800,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    widget.book.isAvailable ? 'BORROW BOOK' : 'RETURN BOOK',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildDateRow(IconData icon, String label, String date, {bool isCritical = false}) {
    return Row(
      children: [
        Icon(icon, size: 20, color: isCritical ? Colors.red : Colors.blueGrey),
        const SizedBox(width: 12),
        Text(label, style: const TextStyle(color: Colors.blueGrey)),
        const Spacer(),
        Text(
          date,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isCritical ? Colors.red : Colors.black,
          ),
        ),
      ],
    );
  }
}
