require 'rails_helper'

module Searches
  RSpec.describe TwitterHashtagService, type: :service do
    subject { described_class }

    context 'class methods' do
      it { is_expected.to respond_to(:make_a_item_by) }
      it { is_expected.to respond_to(:find_tweets_for) }
    end

    describe '.find_tweets_for' do
      xit 'needs to return the crawled items from web' do
        event = create :event, hash_tag: '#justin', services: [ServiceKind::TWITTER]

        expect(event.items.count).to eq(0)

        subject.find_tweets_for(event)

        expect(event.items.count).to eq(100)
      end
    end

    describe '.make_a_item_by' do
      let(:tweet) do
        Twitter::Tweet.new(id: '596008529309278208', text: 'a text tweet',
                           user: { id: '2345643', profile_url: 'http://twitter.com/brunoocasali',
                                   screen_name: 'brunoocasali', name: 'Bruno Casali' })
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

      context 'when tweet is invalid' do
        it 'does not create a Item' do
          last = subject.make_a_item_by(invalid_tweet)

          expect(last).to be_nil
        end
      end
    end

    describe '.make_an_author_by' do
      let(:tweet) do
        Twitter::Tweet.new(id: '596008529309278208', text: 'a text tweet',
                           user: { id: 2_345_643, profile_url: 'http://twitter.com/brunoocasali',
                                   screen_name: 'brunoocasali', name: 'Bruno Casali' })
      end
      let(:invalid_tweet) { nil }

      context 'when tweet is valid' do
        it 'create a new valid Item' do
          author = subject.make_an_author_by(tweet.user)

          expect(author).to be_a(Author)
          expect(author).to_not be_nil
          expect(author.id).to eq(tweet.user.id)
          expect(author.screen_name).to eq("@#{tweet.user.screen_name}")
          expect(author.service).to eq(ServiceKind::TWITTER)
        end
      end

      # context 'when tweet is invalid' do
      #   it 'does not create a Item' do
      #     last = subject.make_an_author_by(invalid_tweet)
      #
      #     expect(last).to be_nil
      #   end
      # end
    end
  end
end
