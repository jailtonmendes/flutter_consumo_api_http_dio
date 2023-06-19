import 'dart:convert';

class PostModel {
  final int id;
  final String title;
  final String body;

  // Constructor
  PostModel({
    required this.id,
    required this.title,
    required this.body,
  });

  //DIO - Na resposta da API, o Dio já transforma o Json para um Map
  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      body: map['body'] ?? '',
    );
  }

  //http - No Http a resposta da API vem no formato Json, precisamos decodificar para se transformar em um Map
  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source));
}
