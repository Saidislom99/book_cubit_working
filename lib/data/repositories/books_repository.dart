import 'package:book_cubit_working/data/model/books/book_model.dart';
import 'package:book_cubit_working/data/services/api_provider.dart';

class BookRepository{
  BookRepository({required this.apiProvider});
  final ApiProvider apiProvider;

Future<List<BookModel>> getAllBook()=>apiProvider.getAllBooks();

Future<BookModel> getBookId({required int id})=>
    apiProvider.getBookId(id: id);

Future<BookModel> addBook({required BookModel bookModel})=>
    apiProvider.addBook(bookModel: bookModel);


Future<bool>deleteBookById({required int id})=>
    apiProvider.deleteBookById(id: id);

  Future<BookModel> updatePatch({
    required String title,
    required int publishYear,
    required int numberOfPages,
    required int price,
    required int id,
  }) =>
      apiProvider.updatePatch(
        title: title,
        publishYear: publishYear,
        numberOfPages: numberOfPages,
        price: price,
        id: id,
      );
}