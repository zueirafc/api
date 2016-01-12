require 'rails_helper'

module Searches
  RSpec.describe TwitterHashtagService, type: :service do
    subject { described_class }

    context 'class methods' do
      it { is_expected.to respond_to(:find_tweets_for) }
    end

    let(:source_params) { { key: '#ruby', kind: SourceKind::TWITTER_HASHTAG } }
    let(:source) { create :source, source_params }
    let(:json) do
      File.read("#{Rails.root}/spec/support/jsons/twitter/search.json")
    end

    describe '.find_tweets_for' do
      before do
        FakeWeb.register_uri(:get, /api.twitter.com/, body: json)
      end

      it 'needs to return the maximum of crawled items from web' do
        expect(source.microposts.count).to eq(0)

        subject.find_tweets_for(source)

        expect(source.microposts.count).to eq(4)
      end

      it 'need to log if an error happens' do
        message = /--- ERROR at Searches::TwitterHashtagService:/
        expect(Rails.logger).to receive(:info).with(message).at_least(:once)

        subject.find_tweets_for(source)
      end
    end
  end
end
