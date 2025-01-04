import 'package:basketball_counter_app/features/search/presentation/manager/serch_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utilis/styles.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          onSubmitted: (data){
            BlocProvider.of<SearchBooksCubit>(context)
                .getSearchBooks(category:data);
          },
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide()
              ),
              suffixIcon: IconButton(onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.magnifyingGlass,
                    size: 20,))
          ),
        ),
        const SizedBox(height: 20,),
        const Text('Search Results', style: Styles.textStyle18,),
        const SizedBox(height: 20,)
      ],
    );
  }
}

//https://www.googleapis.com/books/v1/volumes?q=programming