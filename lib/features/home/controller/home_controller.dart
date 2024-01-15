// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/features/home/repository/home_repository.dart';
import 'package:health_app/models/quote.dart';
import 'package:rxdart/rxdart.dart';

final quoteFutureProvider = FutureProvider((ref) {
  final homeController = ref.watch(homeRepositoryProvider);
  return homeController.getRecipe();
});
// final quoteStreamProvider = StreamProvider((ref) {
//   final homeController = ref.watch(homeControllerProvider);
//   return homeController.quotes;
// });
final homeControllerProvider = Provider((ref) {
  final homeRepository = ref.read(homeRepositoryProvider);
  return HomeController(homeRepository: homeRepository);
});

class HomeController {
  final HomeRepository homeRepository;
  final BehaviorSubject<Quote> _subject = BehaviorSubject<Quote>();
  HomeController({
    required this.homeRepository,
  });

  updateProfile(String contact) async {
    homeRepository.updateProfile(contact);
  }
  // Future<Quote> getRecipe() {
  //   return homeRepository.getRecipe();

  // Quote quote = Quote(quote: response.quote, author: response.author);
  // return quote;

  // Quote response = homeRepository.getRecipe();
  // _subject.sink.add(response);
  // return response;
}

 // Stream<Quote> get quotes => _subject;

  // disposeQuote() {
  //   _subject.close();
  // }

