import 'package:main_app/AppServices/data%20classes/atomic_classes/positive_review_embeddings_sentence_item_class.dart';

class EmbeddingsList {
  List<EmbeddingData> positiveReviewEmbeddings;

  EmbeddingsList({
    required this.positiveReviewEmbeddings,
  });

  factory EmbeddingsList.fromJson(Map<String, dynamic> json) {
    List<dynamic> embeddingsJson = json['Positive_Review_Embeddings'];
    List<EmbeddingData> embeddingsList = embeddingsJson
        .map((embeddingJson) =>
        EmbeddingData.fromJson(embeddingJson))
        .toList();

    return EmbeddingsList(positiveReviewEmbeddings: embeddingsList);
  }

  Map<String, dynamic> toJson() {
    return {
      'Positive_Review_Embeddings':
      positiveReviewEmbeddings.map((embedding) => embedding.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'EmbeddingsList{positiveReviewEmbeddings: $positiveReviewEmbeddings}';
  }
}