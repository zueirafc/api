require 'rails_helper'

module Api
  module V1
    RSpec.describe MediaController, type: :controller do
      let!(:micropost) { create :micropost }

      describe 'DELETE #destroy' do
        it 'destroys the requested medium' do
          medium = create :medium, micropost: micropost

          expect do
            delete :destroy, format: :json, micropost_id: micropost.to_param,
                             id: medium.to_param
          end.to change(Medium, :count).by(-1) &&
                 change(Micropost, :count).by(0)
        end

        it 'redirects to the medium list' do
          medium = create :medium, micropost: micropost

          delete :destroy, format: :json, micropost_id: micropost.to_param,
                           id: medium.to_param

          expect(response).to be_success
        end

        it 'need to do nothing' do
          create :medium, micropost: micropost
          medium2 = create :medium

          expect do
            delete :destroy, format: :json, micropost_id: micropost.to_param,
                             id: medium2.to_param
          end.to raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end
  end
end
