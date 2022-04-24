// import 'package:bloc/bloc.dart';
// import 'package:rent_small_small/service/api_service.dart';

// import '../../models/property.dart';

// part 'property_event.dart';
// part 'property_state.dart';

// class PropertyBloc extends Bloc<PropertyEvent, PropertyState> {
//   PropertyBloc() : super(PropertyInitial()) {
//     final apiService = ApiService();
//     // on<PropertyEvent>((event, emit) {
//     //   // TODO: implement event handler
//     // });

//     @override
//     Stream<PropertyState> mapEventToState(PropertyState event) async* {
//       if (event is LoadPropertyEvent) {
//         yield PropertyLoadingState();

//         try {
//           final res = await apiService.getRequest<List<Property>>('/v', '');

//           yield PropertyLoadedState(properties: res.data!);
//         } catch (e) {
//           yield PropertyFailedToLoadState(error: e.toString());
//         }
//       }
//     }
//   }
// }
