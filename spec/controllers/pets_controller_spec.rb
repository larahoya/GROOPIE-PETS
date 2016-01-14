require 'rails_helper'

RSpec.describe PetsController, type: :controller do
  
  describe '#index' do
    it 'render the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe '#new' do
    before (:each) do
      sign_in FactoryGirl.create(:user)
    end
    it 'render the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe '#create' do
  
    context 'all the information is correct' do
      before (:each) do
        @user = FactoryGirl.create(:user)
        @count = Pet.all.count
        @pet = FactoryGirl.build(:pet)
        sign_in @user
        post :create, {pet: {name: @pet.name, species: @pet.species, age: @pet.age}}
      end
      it 'creates a new pet' do
        expect(Pet.all.count).to eq(@count +1)
      end
      it 'creates a new pet that belongs to the current user' do
        expect(Pet.last.user_id).to eq(@user.id)
      end
      it 'redirect to the user profile' do
        expect(response).to redirect_to(profile_path)
      end
    end

    context 'some information is missing or incorrect' do
      before (:each) do
        @user = FactoryGirl.create(:user)
        @count = Pet.all.count
        @pet = FactoryGirl.build(:pet, name: nil)
        sign_in @user
        post :create, {pet: {name: @pet.name, species: @pet.species, age: @pet.age}}
      end
      it 'does not create a new pet' do
        expect(Pet.all.count).to eq(@count)
      end
      it 'render the new template' do
        expect(response).to render_template(:new)
      end
    end
  end

  describe '#destroy' do
    before (:each) do
      @user = FactoryGirl.create(:user)
      sign_in @user
      @pet = FactoryGirl.create(:pet, user_id: @user.id)
      delete :destroy, {id: @pet.id}
    end

    it 'delete the pet' do
      expect(Pet.all.count).to eq(0)
    end
  end

  describe '#update' do

    context 'all the information is correct' do
      before (:each) do
        @user = FactoryGirl.create(:user)
        sign_in @user
        @pet = FactoryGirl.create(:pet, name:'boby')
        put :update, {id: @pet.id, pet: {name: 'lulu', species: @pet.species, age: @pet.age}}
      end
      it 'update the attributes of the pet' do
        expect(Pet.find(@pet.id).name).to eq('lulu')
      end
      it 'redirect to the user profile' do
        expect(response).to redirect_to(profile_path)
      end
    end

    context 'some information is missing or incorrect' do
      before (:each) do
        @user = FactoryGirl.create(:user)
        sign_in @user
        @pet = FactoryGirl.create(:pet, name:'boby')
        put :update, {id: @pet.id, pet: {name: nil, species: @pet.species, age: @pet.age}}
      end
      it 'does not update the attributes of the pet' do
        expect(Pet.find(@pet.id).name).to eq('boby')
      end
      it 'render the edit template' do
        expect(response).to render_template(:edit)
      end
    end
  end

end
