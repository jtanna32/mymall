import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:mymall/model/pet_model.dart';
import 'package:mymall/source/local/pet_local_repository.dart';

part 'local_pet_event.dart';
part 'local_pet_state.dart';

class LocalPetBloc extends Bloc<LocalPetEvent, LocalPetState> {
  final PetLocalRepository localRepository;

  LocalPetBloc(this.localRepository) : super(LocalPetInitial()) {
    // add pet to cart
    on<AddPetToCartEvent>((event, emit) async {
      addPet(event.petData!);
    });
    // call this event to reset to initial state
    on<GetToInitialEvent>((event, emit) => emit(LocalPetInitial()));
    on<GetAllPetEvent>((event, emit) async {
      emit(GetAllPetLoadingState());
      final pets = await localRepository.getAllPets();
      print(pets.length);
      if (pets.isEmpty) {
        emit(NoPetState(message: "No Pets available"));
      } else {
        emit(GetAllPetSuccessState(pets: pets));
      }
    });
  }

  void addPet(PetModel petsData) async {
    var result = await localRepository.createPet(petsData);
    if (result != null) {
      emit(AddPetSuccessState());
    } else {
      emit(AddPetFailureState(error: "Something went wrong"));
    }
  }
}
