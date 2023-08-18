import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/repos/home_repo.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await homeRepo.fetchNewestBooks();
    result.fold(
      (failure) => emit(
        NewestBooksFailure(failure.errMessage),
      ),
      (books) => emit(
        NewestBooksSuccess(books),
      ),
    );
  }
}
