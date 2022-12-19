part of 'local_pet_bloc.dart';

abstract class LocalPetEvent {
  const LocalPetEvent();
}

class AddPetToCartEvent extends LocalPetEvent {
  PetModel? petData;

  AddPetToCartEvent({this.petData});
}

class GetToInitialEvent extends LocalPetEvent {}

class GetAllPetEvent extends LocalPetEvent {}

class DeletePetEvent extends LocalPetEvent {
  final int id;

  DeletePetEvent({required this.id});
}
