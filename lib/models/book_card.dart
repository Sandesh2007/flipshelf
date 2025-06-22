import 'package:flipshelf/models/book.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final Book book;

  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: book.coverColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  // color: const Color.fromARGB(144, 0, 0, 0),
                  color: book.coverColor,
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              // child: _buildBookCoverDesign(),
              child: Image.asset(
                book.coverImage,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
        ),
        SizedBox(height: 12),
        Text(
          book.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.secondary,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 4),
        Text(
          book.author,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).colorScheme.secondary.withAlpha(240)
            ),
        ),
      ],
    );
  }
}