require 'rails_helper'

RSpec.describe Searches::Base, type: :service do
  context 'about class methods' do
    subject { described_class.new(create(:event)) }

    it 'need to respond' do
      is_expected.to respond_to(:start_finder!)
    end
  end

  describe '.start_finder!' do
    it 'uses an instance of base search class' do
      base = described_class.new(create(:event))

      allow(base).to receive(:start_finder!).with(no_args)

      base.start_finder!
    end

    it 'calls the starter of twitter service' do
      base = described_class.new(create(:event, services: [ServiceKind::TWITTER]))

      allow(base).to receive(:find_with_twitter!).with(no_args)
    end
  end

  describe '.find_with_twitter!' do
    it 'needs to call specific class' do
      event = create(:event, services: [ServiceKind::TWITTER])

      expect(Search::TwitterService).to receive(:find_tweets_for).with(event)

      described_class.new(event).start_finder!
    end
  end
end
