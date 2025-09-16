class CheckFaqState {
  CheckFaqState({
    this.faqQuestionLevel,
  });

  factory CheckFaqState.initial() {
    return CheckFaqState();
  }
  final String? faqQuestionLevel;

  CheckFaqState copyWith({
    String? faqQuestionLevel,
  }) {
    return CheckFaqState(
      faqQuestionLevel: faqQuestionLevel,
    );
  }
}
