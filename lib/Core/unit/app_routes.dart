import 'package:go_router/go_router.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/create_account_view.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/login_view.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/add_parking_view.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/business_flow/parking_title_view.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/business_flow/type_of_property_view.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/business_flow/working_hours_view.dart';


abstract class AppRouter {

  static const kLogin='/Login';
  static const kCreateAccount='/CreateAccount';
  static const kAddParking='/AddParking';
  static const kParkingTitleView='/kParkingTitleView';
  static const kTypeOfPropertyView='/kTypeOfPropertyView';
  static const kWorkingHoursView='/kWorkingHoursView';

  static final GoRouter router = GoRouter(
    routes: [

      GoRoute(
        path: '/',
        builder: (context, state) => const Login(),
      ),

      GoRoute(
        path: kLogin,
        builder: (context, state)=> const Login(),
      ),

      GoRoute(
          path: kCreateAccount,
          builder: (context, state)=> const CreateAccount(),
      ),

      GoRoute(
        path: kAddParking,
        builder: (context, state)=> const AddParking(),
      ),

      GoRoute(
        path: kParkingTitleView,
        builder: (context, state)=> const ParkingTitleView(),
      ),

      GoRoute(
        path: kTypeOfPropertyView,
        builder: (context, state)=> const TypeOfPropertyView(),
      ),

      GoRoute(
        path: kWorkingHoursView,
        builder: (context, state)=> const WorkingHoursView(),
      ),

    ],
  );
}
