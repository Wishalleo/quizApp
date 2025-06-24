class QuestionModel {
  const QuestionModel(this.text, this.answer);

  final String text;
  final List<String> answer;

  List<String> getShuffleAnswer() {
    final shuffleList = List.of(answer);
    shuffleList.shuffle();
    return shuffleList;
  }
}
