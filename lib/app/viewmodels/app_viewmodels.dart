import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../features/parent/view_model/parent_view_model.dart';

class AppViewModels {
  static final List<SingleChildWidget> viewmodels = [
    ChangeNotifierProvider<ParentViewModel>(
      create: (_) => ParentViewModel(),
    ),

    // ChangeNotifierProvider<ParentScreenProvider>(
    //   create: (_) => ParentScreenProvider(), // Directly initializing the ParentScreenProvider
    // ),

  ];
}
