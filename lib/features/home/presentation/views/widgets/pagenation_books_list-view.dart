
import 'package:flutter/material.dart';
import '../../../domain/entity/book_entity.dart';
import 'books_list_view_image.dart';

class PagenationBooksListView extends StatefulWidget {
  const PagenationBooksListView({Key? key,
    required this.books,
    required this.getBooks,
  }) : super(key: key);
  final List<BookEntity> books;
  final Future<void> getBooks;

  @override
  State<PagenationBooksListView> createState() => _PagenationBooksListViewState();
}



class _PagenationBooksListViewState extends State<PagenationBooksListView> {
  late ScrollController scrollController;
 bool isLoading=false;

  @override
  void initState() {
    super.initState();
    scrollController=ScrollController();
    scrollController.addListener(scrollListener);
  }
  void scrollListener(){
    var currentPosition= scrollController.position.pixels;
    var maxPosition=scrollController.position.maxScrollExtent;
    if(currentPosition >= 0.7 * maxPosition ){
      if (isLoading==false) {
        isLoading=true;
        widget.getBooks;
        isLoading=false;//to stop fetch data before the previous requst is completed
      }
    }
  }

  @override
  void dispose(){
  scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.books.length,
        itemBuilder: (context, index) {
          return  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child:BooksListViewImage(
                bookEntity: widget.books[index],
              )
          );
        }

    );
  }
}
