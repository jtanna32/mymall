part of 'local_pet_bloc.dart';

abstract class LocalPetState {
  const LocalPetState();
}

class LocalPetInitial extends LocalPetState {
  @override
  List<Object> get props => [];
}

class AddPetSuccessState extends LocalPetState {}

class AddPetLoadingState extends LocalPetState {}

class AddPetFailureState extends LocalPetState {
  String? error;

  AddPetFailureState({this.error});
}

class PetAlreadyAddedState extends LocalPetState {
  String? message;

  PetAlreadyAddedState({this.message});
}

class GetAllPetSuccessState extends LocalPetState {
  List<PetData>? pets;

  GetAllPetSuccessState({this.pets});

  @override
  List<Object?> get props => [pets];
}

class GetAllPetLoadingState extends LocalPetState {}

class NoPetState extends LocalPetState {
  String? message;

  NoPetState({this.message});
}

class DeletePetSuccessState extends LocalPetState {}

class DeletePetLoadingState extends LocalPetState {}

class DeletePetFailureState extends LocalPetState {
  String? error;

  DeletePetFailureState({this.error});
}
