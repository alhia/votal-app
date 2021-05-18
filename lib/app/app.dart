import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votal_app/services/user_service.dart';
import 'package:votal_app/ui/startup/startup_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartUpView, initial: true),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: UserService),
  ],
  logger: StackedLogger(),
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}
