import 'package:basketball_counter_app/features/home/data/models/book_model/book_model.dart';
import 'package:basketball_counter_app/features/home/domain/entity/book_entity.dart';
import 'package:basketball_counter_app/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:basketball_counter_app/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BookDetailsView extends StatefulWidget {
  const BookDetailsView({Key? key, required this.bookEntity}) : super(key: key);
  final BookEntity bookEntity;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context)
        .getSimilarBooks(category:widget.bookEntity.category??'');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BookDetailsViewBody(bookEntity: widget.bookEntity,),
    );
  }
}