

import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../data/model/books/book_model.dart';

class BooksState extends Equatable {
  BooksState(
      {required this.formzStatus,
      required this.books,
      required this.errorText});

  final List<BookModel> books;
  final FormzStatus formzStatus;
  final String errorText;

  BooksState copyWith({
  List<BookModel>? books,
    String? errorText,
    FormzStatus? formzStatus,
}) =>
      BooksState(
          formzStatus: formzStatus ?? this.formzStatus,
          books: books ?? this.books,
          errorText: errorText ?? this.errorText);
  @override
  List<Object>get props =>[
    books,
    formzStatus,
    errorText
  ];
}
