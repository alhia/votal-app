import 'package:stacked/stacked.dart';
import 'package:votal_app/app/app.gr.dart';
import 'package:votal_app/app/locator.dart';

class HomeViewModel extends BaseViewModel {
  final router = locator<AppRouter>();
  void navigateToCreatePost() =>
      router.root.push(HomeWrapper(children: [CreatePostModal()]));
}
