import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'seach_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.searchRepo) : super(SearchBooksInitial());

    final SearchRepo searchRepo;
    late String searchText;
  Future<void> fetchSearchBooks()async{
    emit(SearchBooksLoading());
    var result = await searchRepo.fetchSearchedBook(searchBook: searchText);
    result.fold(
      (failure) => emit(
        SearchBooksFailure(failure.errMessage),
      ),
      (books) => emit(
        SearchBooksSuccess(books),
      ),
    );
    

  }
}
