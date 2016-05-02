require 'rails_helper'
module V1
  RSpec.describe ContactsController, type: :controller do
    let!(:category) { create(:contact_category) }
    let(:valid_attributes) { build(:contact, category: category).attributes }
    let(:invalid_attributes) { attributes_for(:invalid_contact) }

    describe 'GET #index' do
      it 'returns a collection of contacts' do
        contact = create :contact, valid_attributes

        get :index, format: :json

        expect(assigns(:contacts)).to include(contact)
      end
    end

    describe 'GET #show' do
      it 'returns a contact passed by param' do
        contact = create :contact, valid_attributes

        get :show, id: contact.to_param, format: :json
        expect(assigns(:contact)).to eq(contact)

        contact = ContactSerializer.new(contact).to_json

        expect(response.body).to eq(contact)
      end
    end

    describe 'POST #create' do
      context 'with valid params' do
        it 'creates a new Contact' do
          expect do
            post :create, format: :json, contact: valid_attributes
          end.to change(Contact, :count).by(1)
        end

        it 'assigns a newly created contact as @contact' do
          post :create, format: :json, contact: valid_attributes

          expect(assigns(:contact)).to be_a(Contact)
          expect(assigns(:contact)).to be_persisted
        end

        it 'redirects to the created contact' do
          post :create, format: :json, contact: valid_attributes

          expect(response).to be_created
        end

        it 'needs to send a new email' do
          expect do
            post :create, format: :json, contact: valid_attributes
          end.to change { ActionMailer::Base.deliveries.count }.by(1)
        end
      end

      context 'with invalid params' do
        it 'assigns a newly created but unsaved contact as @contact' do
          post :create, format: :json, contact: invalid_attributes

          expect(assigns(:contact)).to be_a_new(Contact)
        end

        it 'return contact for unprocessed entity' do
          post :create, format: :json, contact: invalid_attributes

          expect(response).to be_unprocessable
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'destroys the requested contact' do
        contact = create :contact, valid_attributes

        expect do
          delete :destroy, format: :json, id: contact.to_param
        end.to change(Contact, :count).by(-1)
      end

      it 'redirects to the contact list' do
        contact = create :contact, valid_attributes

        delete :destroy, format: :json, id: contact.to_param

        expect(response).to be_success
      end
    end
  end
end
