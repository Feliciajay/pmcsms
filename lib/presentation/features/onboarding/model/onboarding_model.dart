class OnboardingModel {
  final String image;
  final String title;
  final String description;

  OnboardingModel(
      {required this.image, required this.title, required this.description});
}

List<OnboardingModel> onboardingData = [
  OnboardingModel(
      image: 'assets/images/onboard_image_one.png',
      title: 'Schedule Messages',
      description: 'let’s help you send message on your behalf'),
  OnboardingModel(
      image: 'assets/images/onboard_image_two.png',
      title: 'Schedule Messages',
      description: 'let’s help you send message on your behalf'),
  OnboardingModel(
      image: 'assets/images/onboard_image_three.png',
      title: 'Multi-Channel Messaging',
      description: 'let’s help you send message on your behalf'),
];
