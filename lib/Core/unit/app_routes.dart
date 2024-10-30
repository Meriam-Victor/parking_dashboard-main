import 'package:go_router/go_router.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/create_account_view.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/login_view.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/add_parking_view.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/business_flow/parking_title_view.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/business_flow/type_of_property_view.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/business_flow/working_hours_view.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/business_flow/type_of_parking_view.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/business_flow/adding_parking_pictures_view.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/business_flow/confirm_reservation_view.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/business_flow/offered_services_first_view.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/business_flow/terms_and_conditions_view.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/business_flow/type_of_vehicle_view.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/business_flow/manage_payment_view.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/business_flow/offered_services_second_view.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/business_flow/type_of_booking_view.dart';

abstract class AppProviderRouter {

  static const kLogin='/Login';
  static const kCreateAccount='/CreateAccount';
  static const kAddParking='/AddParking';
  static const kParkingTitleView='/kParkingTitleView';
  static const kTypeOfPropertyView='/kTypeOfPropertyView';
  static const kWorkingHoursView='/kWorkingHoursView';
  static const kTypeOfParkingView='/kTypeOfParkingView';
  static const kTypeOfVehicleView='/kTypeOfVehicleView';
  static const kTermsAndConditionsView='/kTermsAndConditionsView';
  static const kConfirmReservationView='/kConfirmReservationView';
  static const kAddingParkingPicturesView='/kAddingParkingPicturesView';
  static const kOfferedServicesFirstView='/kOfferedServicesFirstView';
  static const kOfferedServicesSecondView='/kOfferedServicesSecondView';
  static const kTypeOfBookingView='/kTypeOfBookingView';
  static const kManagePaymentView='/kManagePaymentView';

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

      GoRoute(
        path: kTypeOfParkingView,
        builder: (context, state)=> const TypeOfParkingView(),
      ),

      GoRoute(
        path: kTypeOfVehicleView,
        builder: (context, state)=> const TypeOfVehicleView(),
      ),

      GoRoute(
        path: kTermsAndConditionsView,
        builder: (context, state)=> const TermsAndConditionsView(),
      ),

      GoRoute(
        path: kConfirmReservationView,
        builder: (context, state)=> const ConfirmReservationView(),
      ),

      GoRoute(
        path: kAddingParkingPicturesView,
        builder: (context, state)=> const AddingParkingPicturesView(),
      ),

      GoRoute(
        path: kOfferedServicesFirstView,
        builder: (context, state)=> const OfferedServicesFirstView(),
      ),

      GoRoute(
        path: kOfferedServicesSecondView,
        builder: (context, state)=> const OfferedServicesSecondView(),
      ),

      GoRoute(
        path: kTypeOfBookingView,
        builder: (context, state)=> const TypeOfBookingView(),
      ),

      GoRoute(
        path: kManagePaymentView,
        builder: (context, state)=> const ManagePaymentView(),
      ),
    ],
  );
}
