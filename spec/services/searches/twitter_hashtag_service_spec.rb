require 'rails_helper'
# require 'support/uris/registered_uris'

module Searches
  RSpec.describe TwitterHashtagService, type: :service do
    subject { described_class }

    context 'class methods' do
      it { is_expected.to respond_to(:find_tweets_for) }
    end

    let(:source_params) { { key: '#ruby', kind: SourceKind::TWITTER_HASHTAG } }
    let(:source) { create :source, source_params }

    describe '.find_tweets_for' do
      it 'needs to return the maximum of crawled items from web' do
        expect(source.microposts.count).to eq(0)

        subject.find_tweets_for(source)

        expect(source.microposts.count).to eq(100)
      end

      it 'need to log if an error happens' do
        message = /--- ERROR at TwitterHashtagService:/
        expect(Rails.logger).to receive(:info).with(message)

        subject.find_tweets_for(source)
      end
    end

    xdescribe '.make_a_item_by' do
      let(:tweet) do
        Twitter::Tweet.new(id: '596008529309278208', text: 'a text tweet',
                           user: { id: '2345643',
                                   profile_url: 'http://twitter.com/brunoocasali',
                                   screen_name: 'brunoocasali',
                                   name: 'Bruno Casali' })
      end
      let(:invalid_tweet) { nil }

      context 'when tweet is valid' do
        it 'create a new valid Item' do
          last = subject.make_a_item_by(tweet)

          expect(tweet).to be_a(Twitter::Tweet)
          expect(last).to be_a(Item)
          expect(last.author).to be_a(Author)
          expect(last).to_not be_nil
          expect(last.author).to_not be_nil
          expect(last.id).to eq(tweet.id)
          expect(last.text).to eq(tweet.text)
          expect(last.status).to eq(ItemStatus::LISTED)
          expect(last.service).to eq(ServiceKind::TWITTER)
        end
      end

    end
  end
end
