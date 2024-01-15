import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Quote {
  final List<String> quote;
  final List<String> author;

  Quote({
    required this.quote,
    required this.author,
  });

  // Quote.fromJson(Map<String, dynamic> json)
  //     : quote = json['quote'],
  //       author = json['author'],
  //       category = json['category'];

  Quote.fromJson(List<dynamic> json)
      : quote = json.map((e) {
          return e['quote'].toString();
        }).toList(),
        author = json.map((e) {
          return e['author'].toString();
        }).toList();

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'quote': quote,
  //     'author': author,
  //   };
  // }

  // factory Quote.fromMap(Map<String, dynamic> map) {
  //   return Quote(
  //     quote: map['quote'] as String,
  //     author: map['author'] as String,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory Quote.fromJson(List<dynamic> source) =>
  //     Quote.fromMap(json.decode(source as String) as Map<String, dynamic>);

  // Quote copyWith({
  //   String? quote,
  //   String? author,
  // }) {
  //   return Quote(
  //     quote: quote ?? this.quote,
  //     author: author ?? this.author,
  //   );
  // }

  // @override
  // String toString() => 'Quote(quote: $quote, author: $author)';

  // @override
  // bool operator ==(covariant Quote other) {
  //   if (identical(this, other)) return true;

  //   return other.quote == quote && other.author == author;
  // }

  // @override
  // int get hashCode => quote.hashCode ^ author.hashCode;

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'quote': quote,
  //     'author': author,
  //     'category': category,
  //   };
  // }

  // factory Quote.fromMap(Map<String, dynamic> map) {
  //   return Quote(
  //     quote: map['quote'] as String,
  //     author: map['author'] as String,
  //     category: map['category'] as String,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory Quote.fromJson(String source) =>
  //     Quote.fromMap(json.decode(source) as Map<String, dynamic>);
}
