require 'rails_helper'

module Searches
  RSpec.describe TwitterUserService, type: :service do
    subject { described_class }

    context 'class methods' do
      it { is_expected.to respond_to(:find_tweets_for) }
    end

    let(:params) { { key: '@thoughtworks', kind: SourceKind::TWITTER_USER } }
    let(:source) { create :source, params }
    let(:json) do
      File.read("#{Rails.root}/spec/support/requests/twitter/search-user.json")
    end

    describe '.find_tweets_for' do
      before { FakeWeb.register_uri(:get, /api.twitter.com/, body: json) }

      it 'needs to return the maximum of crawled items from web' do
        expect(source.microposts.count).to eq(0)

        subject.find_tweets_for(source)

        expect(source.microposts.count).to eq(4)
      end

      it 'need to log if an error happens' do
        message = /--- ERROR at Searches::TwitterUserService:/
        expect(Rails.logger).to receive(:info).with(message).at_least(:once)

        subject.find_tweets_for(source)
      end

      it 'add troller from source' do
        subject.find_tweets_for(source)

        club = source.troller
        club_from_post = source.last.trollers.first.trollerable

        expect(club).to eq(club_from_post)
      end

      it 'attach to post media' do
        subject.find_tweets_for(source)

        expect(source.microposts.map(&:media).compact.count).to be > 1
      end
    end
  end
end
