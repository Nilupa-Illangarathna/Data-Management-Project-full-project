class EmbeddingData {
  List<double> embedding;
  String sentence;

  EmbeddingData({
    required this.embedding,
    required this.sentence,
  });

  factory EmbeddingData.fromJson(Map<String, dynamic> json) {
    return EmbeddingData(
      embedding: List<double>.from(json['embedding']),
      sentence: json['sentence'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'embedding': embedding,
      'sentence': sentence,
    };
  }

  @override
  String toString() {
    return 'EmbeddingData{embedding: $embedding, sentence: $sentence}';
  }
}