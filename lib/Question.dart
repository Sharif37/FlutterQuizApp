class Question {

  Question(this.question, this.options);

  final String question ;
  final List<String> options ;


  List<String> getShuffledOptions(){
    final shuffleList=List.of(options) ;
    shuffleList.shuffle();
    return shuffleList ;
  }
}