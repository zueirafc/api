require 'rails_helper'

module Searches
  RSpec.describe BaseService, type: :service do
    context 'respond_to methods' do
      subject { described_class.new(nil) }

      it { is_expected.to respond_to(:start_finder!) }

      it { is_expected.to respond_to(:find_by_atom_feed!) }
      it { is_expected.to respond_to(:find_by_facebook_page!) }
      it { is_expected.to respond_to(:find_by_rss_feed!) }
      it { is_expected.to respond_to(:find_by_twitter_user!) }
      it { is_expected.to respond_to(:find_by_facebook_page!) }
    end

    describe '#start_finder!' do
      it 'uses an instance of base search class' do
        base = described_class.new(create(:source))

        expect(base).to receive(:start_finder!).with(no_args)

        base.start_finder!
      end
    end

    context 'based on source kind call right method' do
      before :each do
        @source = create(:source, :active)
        @base = described_class.new @source
      end

      after { @base.start_finder! }

      context 'when kind is SourceKind::FACEBOOK_PAGE' do
        describe '#find_by_facebook_page' do
          it 'calls the starter of right service' do
            @source.update!(kind: SourceKind::FACEBOOK_PAGE)

            expect(@base).to receive(:find_by_facebook_page!).with(no_args)
          end
        end
      end

      context 'when kind is SourceKind::TWITTER_USER' do
        describe '#find_by_twitter_user' do
          it 'calls the starter of right service' do
            @source.update!(kind: SourceKind::TWITTER_USER)

            expect(@base).to receive(:find_by_twitter_user!).with(no_args)
          end
        end
      end

      context 'when kind is SourceKind::ATOM_FEED' do
        describe '#find_by_atom_feed' do
          it 'calls the starter of right service' do
            @source.update!(kind: SourceKind::ATOM_FEED)

            expect(@base).to receive(:find_by_atom_feed!).with(no_args)
          end
        end
      end

      context 'when kind is SourceKind::RSS_FEED' do
        describe '#find_by_rss_feed' do
          it 'calls the starter of right service' do
            @source.update!(kind: SourceKind::RSS_FEED)

            expect(@base).to receive(:find_by_rss_feed!).with(no_args)
          end
        end
      end

      context 'when kind is SourceKind::INSTAGRAM_USER' do
        describe '#find_by_instagram_user' do
          it 'calls the starter of right service' do
            @source.update!(kind: SourceKind::INSTAGRAM_USER)

            expect(@base).to receive(:find_by_instagram_user!).with(no_args)
          end
        end
      end

      context 'when kind is SourceKind::TWITTER_HASHTAG' do
        describe '#find_by_twitter_hashtag' do
          it 'calls the starter of right service' do
            @source.update!(kind: SourceKind::TWITTER_HASHTAG)

            expect(@base).to receive(:find_by_twitter_hashtag!).with(no_args)
          end
        end
      end
    end
  end
end
