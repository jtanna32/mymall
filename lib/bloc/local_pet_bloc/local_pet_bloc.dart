import 'package:bloc/bloc.dart';
import 'package:mymall/model/pet.dart';
import 'package:mymall/source/local/pet_local_repository.dart';

part 'local_pet_event.dart';
part 'local_pet_state.dart';

class LocalPetBloc extends Bloc<LocalPetEvent, LocalPetState> {
  final PetLocalRepository localRepository;

  LocalPetBloc(this.localRepository) : super(LocalPetInitial()) {
    // add pet to cart
    on<AddPetToCartEvent>((event, emit) async {
      var pets = await localRepository.getAllPets();
      if (pets != null) {
        final filteredPets = pets
            .where((element) => element.id == event.petData!.id)
            .toList();
        if (filteredPets.isEmpty) {
          addPet(event.petData!);
        } else {
          emit(PetAlreadyAddedState(message: "Pet Already added"));
        }
      } else {
        addPet(event.petData!);
      }
    });
    // call this event to reset to initial state
    on<GetToInitialEvent>((event, emit) => emit(LocalPetInitial()));
    on<GetAllPetEvent>((event, emit) async {
      emit(GetAllPetLoadingState());
      final pets = await localRepository.getAllPets();
      if (pets.isEmpty) {
        emit(NoPetState(message: "No Pets available"));
      } else {
        emit(GetAllPetSuccessState(pets: pets));
      }
    });
    // delete pet from cart
    on<DeletePetEvent>((event, emit) async {
      emit(DeletePetLoadingState());
      final result = await localRepository.deletePetById(event.id);
      if (result != null) {
        emit(DeletePetSuccessState());
      } else {
        emit(DeletePetFailureState(error: "Something went wrong"));
      }
    });
  }

  void addPet(PetData petsData) async {
    var result = await localRepository.createPet(petsData);
    if (result != null) {
      emit(AddPetSuccessState());
    } else {
      emit(AddPetFailureState(error: "Something went wrong"));
    }
  }
}
