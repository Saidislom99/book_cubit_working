import 'package:book_cubit_working/cubits/book/books_cubit.dart';
import 'package:book_cubit_working/cubits/book/books_state.dart';
import 'package:book_cubit_working/data/model/books/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({Key? key}) : super(key: key);

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    BlocProvider.of<BooksCubit>(context).getAllBooks();
  }

  TextEditingController bookController = TextEditingController();

  @override
  void dispose() {
    bookController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Book screen"),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          //  color:  Color.fromARGB(
                          //   120, 255, 255, 255)
                        ),
                        child: AlertDialog(
                          backgroundColor:
                              const Color.fromARGB(120, 255, 255, 255),
                          title: const Text("Book add"),
                          content: SizedBox(
                            height: 150,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextField(
                                  controller: bookController,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      BlocProvider.of<BooksCubit>(context)
                                          .addBook(BookModel(
                                              id: 7,
                                              title: bookController.text,
                                              genre: 4,
                                              isbn: "",
                                              language: 2,
                                              numberOfPages: 100,
                                              price: 77,
                                              publisherId: 36,
                                              publishYear: 2022));
                                      BlocProvider.of<BooksCubit>(context).getAllBooks();
                                      Navigator.pop(context);
                                      bookController.text="";
                                    },
                                    child: Text("Ok"))
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.add,
                  size: 32,
                )),
          ],
        ),
        body: BlocBuilder<BooksCubit, BooksState>(
          builder: (context, state) {
            if (state.formzStatus == FormzStatus.submissionInProgress) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.formzStatus == FormzStatus.submissionFailure) {
              return const Center(
                child: Text("Error"),
              );
            } else {
              return ListView(
                children: List.generate(
                    state.books.length,
                    (index) => ListTile(
                          title: Text(state.books[index].title),
                          subtitle: Text(
                            state.books[index].genre.toString(),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                BlocProvider.of<BooksCubit>(context)
                                    .deleteBookById(state.books[index].id);
                              },
                              icon: const Icon(
                                Icons.delete_rounded,
                                color: Colors.red,
                              )),
                        )),
              );
            }
          },
        ));
  }
}
