require 'rails_helper'

RSpec.describe Newsletter, type: :model do
  context 'model validations' do
    it { is_expected.to validate_presence_of(:email) }

    it :status do
      is_expected.to validate_presence_of(:status)
      is_expected.to validate_inclusion_of(:status)
        .in_array(CommonStatus.list)
    end
  end

  context 'table fields' do
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:is_accepted_partner).of_type(:boolean) }
    it { is_expected.to have_db_column(:status).of_type(:integer) }
  end

  context 'table indexes' do
    it { is_expected.to have_db_index(:email).unique }
    it { is_expected.to have_db_index(:status) }
  end
end
