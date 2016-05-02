require 'rails_helper'

module V1
  RSpec.describe ContactCategoriesController, type: :controller do
    let(:valid_attributes) { attributes_for(:contact_category) }
    let(:invalid_attributes) { attributes_for(:invalid_contact_category) }

    describe 'GET #index' do
      it 'returns a collection of categories' do
        category = create :contact_category, valid_attributes

        get :index, format: :json

        expect(assigns(:categories)).to include(category)
      end
    end

    context 'dynamic methods' do
      describe '.make_list_actions_by' do
        let!(:active) do
          create :contact_category, status: CommonStatus::ACTIVE
        end
        let!(:inactive) do
          create :contact_category, status: CommonStatus::INACTIVE
        end

        describe 'GET #active' do
          it 'returns a collection of categories' do
            get :active, format: :json

            expect(assigns(:contact_categories)).to include(active)
            expect(assigns(:contact_categories)).to_not include(inactive)
          end
        end

        describe 'GET #inactive' do
          it 'returns a collection of categories' do
            get :inactive, format: :json

            expect(assigns(:contact_categories)).to include(inactive)
            expect(assigns(:contact_categories)).to_not include(active)
          end
        end
      end
    end

    describe 'GET #show' do
      it 'returns a category passed by param' do
        category = create :contact_category, valid_attributes

        get :show, id: category.to_param, format: :json
        expect(assigns(:category)).to eq(category)

        category = ContactCategorySerializer.new(category).to_json

        expect(response.body).to eq(category)
      end
    end

    describe 'POST #create' do
      context 'with valid params' do
        it 'creates a new ContactCategory' do
          expect do
            post :create, format: :json, category: valid_attributes
          end.to change(ContactCategory, :count).by(1)
        end

        it 'assigns a newly created category as @category' do
          post :create, format: :json, category: valid_attributes

          expect(assigns(:category)).to be_a(ContactCategory)
          expect(assigns(:category)).to be_persisted
        end

        it 'redirects to the created category' do
          post :create, format: :json, category: valid_attributes

          expect(response).to be_created
        end
      end

      context 'with invalid params' do
        it 'assigns a newly created but unsaved category as @category' do
          post :create, format: :json, category: invalid_attributes

          expect(assigns(:category)).to be_a_new(ContactCategory)
        end

        it 'return category for unprocessed entity' do
          post :create, format: :json, category: invalid_attributes

          expect(response).to be_unprocessable
        end
      end
    end

    describe 'PUT #update' do
      context 'with valid params' do
        let(:new_attributes) { attributes_for :contact_category, name: 'nn' }

        it 'updates the requested category' do
          category = create :contact_category, valid_attributes

          put :update, id: category.to_param, category: new_attributes,
                       format: :json

          category.reload

          expect(category.name).to eq('nn')
          expect(response).to be_success
        end

        it 'assigns the requested category as @category' do
          category = create :contact_category, valid_attributes

          put :update, format: :json, id: category.to_param,
                       category: valid_attributes

          expect(assigns(:category)).to eq(category)
        end
      end

      context 'with invalid params' do
        it 'assigns the category as @category' do
          category = create :contact_category, valid_attributes

          put :update, format: :json, id: category.to_param,
                       category: invalid_attributes

          expect(assigns(:category)).to eq(category)
        end

        it 'return category for unprocessed entity' do
          category = create :contact_category, valid_attributes

          put :update, format: :json, id: category.to_param,
                       category: invalid_attributes

          expect(response).to be_unprocessable
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'destroys the requested category' do
        category = create :contact_category, valid_attributes

        delete :destroy, format: :json, id: category.to_param
        category.reload

        expect(category).to be_inactive
      end

      it 'redirects to the category list' do
        category = create :contact_category, valid_attributes

        delete :destroy, format: :json, id: category.to_param

        expect(response).to be_success
      end
    end
  end
end
