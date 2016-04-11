FactoryGirl.define do
  # rubocop:disable Metrics/LineLength
  factory :medium do
    file { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/support/images/media/docker.png')) }

    kind { MediumKind.list.sample }

    micropost { build(:micropost) }
  end

  factory :invalid_medium, parent: :medium do
    file nil

    kind nil

    micropost nil
  end
end
