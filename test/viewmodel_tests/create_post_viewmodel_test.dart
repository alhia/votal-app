import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:votal_app/ui/create_post/create_post_viewmodel.dart';

import '../helpers/test_helpers.dart';

CreatePostViewModel _getModel() => CreatePostViewModel();
void main() {
  group('CreatePostViewModelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    group('intialise -', () {
      test('Should call getLocalFiles when intialised is called', () {
        final fileService = getAndRegisterFileService();

        final model = _getModel();
        model.initialise();
        verify(fileService.getLocalFiles());
      });
    });
  });
}
