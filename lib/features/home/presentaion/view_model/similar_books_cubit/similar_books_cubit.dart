import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/book_model/book_model.dart';
import '../../../data/repos/home_repo.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepo homeRepo;
  late BookModel bookModel;
  Future<void> fetchSimilarBooks() async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSimilarBooks(category: bookModel.volumeInfo.categories![0]);
    result.fold(
      (failure) => emit(
        SimilarBooksFailure(failure.errMessage),
      ),
      (books) => emit(
        SimilarBooksSuccess(books),
      ),
    );
}
}