import 'package:book_cubit_working/data/model/helper/helper_model.dart';
import 'package:book_cubit_working/data/services/api_provider.dart';

import '../model/books/book_model.dart';

class PublisherRepository{
  PublisherRepository({required this.apiProvider});
  final ApiProvider apiProvider;

  Future<List<BookModel>> getPublisherId({required int id})=>
      apiProvider.getPublisherById(id: id);

  Future<List<HelperModel>> getAllPublisher()=> apiProvider.getPublisher();
}