import 'package:book_cubit_working/data/model/books/book_model.dart';
import 'package:book_cubit_working/data/model/helper/helper_model.dart';
import 'package:book_cubit_working/data/services/api_client.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final ApiClient apiClient;

  ApiProvider({required this.apiClient});

// ---------- Book All Book--------------------

  Future<List<BookModel>> getAllBooks() async {
    Response response =
        await apiClient.dio.get("${apiClient.dio.options.baseUrl}/api/books");

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      List<BookModel> books = (response.data  as List?)
              ?.map((e) => BookModel.fromJson(e))
              .toList() ??
          [];
      return books;
    } else {
      throw Exception();
    }
  }

  Future<BookModel> getBookId({required int id}) async {
    Response response = await apiClient.dio
        .get("${apiClient.dio.options.baseUrl}/api/books$id");
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return BookModel.fromJson(response.data!);
    } else {
      throw Exception();
    }
  }

// -------------------------- ---------------Book ADD-------------------------------------------------------------
  Future<BookModel> addBook({required BookModel bookModel}) async {
    Response response = await apiClient.dio
        .post("${apiClient.dio.options.baseUrl}/api/books", data: {
      "title": bookModel.title,
      "publishYear": bookModel.publishYear,
      "numberOfPages": bookModel.numberOfPages,
      "publisherId": bookModel.publisherId,
      "price": bookModel.price,
      "genre": bookModel.genre,
      "language": bookModel.language
    });
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return BookModel.fromJson(response.data!);
    } else {
      throw Exception();
    }
  }



  Future<bool> deleteBookById({required int id}) async {
    Response response = await apiClient.dio.delete(
      "${apiClient.dio.options.baseUrl}/api/books",
      queryParameters: {"id": id},
    );
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return response.data as bool;
    } else {
      throw Exception();
    }
  }

  Future<BookModel> updatePatch({
    required String title,
    required int publishYear,
    required int numberOfPages,
    required int price,
    required int id,
  }) async {
    Response response = await apiClient.dio
        .patch("${apiClient.dio.options.baseUrl}/api/books", queryParameters: {
      "id": id
    }, data: {
      "title": title,
      "publishYear": publishYear,
      "numberOfPages": numberOfPages,
      "price": price,
    });
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return BookModel.fromJson(response.data);
    } else {
      throw Exception();
    }
  }

  // ----------------------------------------------------- Helper-----------------------------------------------------------

  Future<List<HelperModel>> getLanguages() async {
    Response response = await apiClient.dio
        .get("${apiClient.dio.options.baseUrl}/api/books/languages");

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      List<HelperModel> languages = (response.data as List?)
              ?.map((e) => HelperModel.fromJson(e))
              .toList() ??
          [];
      return languages;
    } else {
      throw Exception();
    }
  }

  Future<List<HelperModel>> getGenres() async {
    Response response = await apiClient.dio
        .get("${apiClient.dio.options.baseUrl}/api/books/genres");

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      List<HelperModel> genre = (response.data as List?)
              ?.map((e) => HelperModel.fromJson(e))
              .toList() ??
          [];
      return genre;
    } else {
      throw Exception();
    }
  }


//--------------------------------Publisher--------------------------------------------

  Future<List<HelperModel>> getPublisher() async {
    Response response = await apiClient.dio
        .get("${apiClient.dio.options.baseUrl}/api/publishers");

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      List<HelperModel> publisher = (response.data as List?)
          ?.map((e) => HelperModel.fromJson(e))
          .toList() ??
          [];
      return publisher;
    } else {
      throw Exception();
    }
  }




  Future<List<BookModel>> getPublisherById({required int id}) async {
    Response response =
    await apiClient.dio.get("${apiClient.dio.options.baseUrl}/api/publishers/$id");

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      List<BookModel> pub = (response.data ["books"] as List?)
          ?.map((e) => BookModel.fromJson(e))
          .toList() ??
          [];
      return pub;
    } else {
      throw Exception();
    }
  }


}
