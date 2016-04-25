require 'rails_helper'

module Searches
  RSpec.describe AtomFeedService, type: :service do
    subject { described_class }

    context 'class methods' do
      it { is_expected.to respond_to(:find_microposts_by) }
    end

    let(:source) do
      create :source, key: 'http://kibeloco.com.br/feed/',
                      kind: SourceKind::ATOM_FEED
    end

    describe '.find_microposts_by' do
      context 'valid request/response' do
        let!(:xml) do
          File.read(Rails.root + 'spec/support/requests/feeds/atom.xml')
        end

        before do
          FakeWeb.register_uri(:get, 'http://kibeloco.com.br/feed/', body: xml)
        end

        it 'needs to return the maximum of crawled items from web' do
          expect(source.microposts.count).to eq(0)

          subject.find_microposts_by(source)

          expect(source.microposts.count).to eq(4)
        end

        it 'add troller from source' do
          subject.find_microposts_by(source)

          club = source.troller
          club_from_post = source.last.trollers.first.trollerable

          expect(club).to eq(club_from_post)
        end

        it 'attach to post media' do
          expect(Medium).to receive(:create).with(any_args).at_least(:once)

          subject.find_microposts_by(source)

          expect(source.microposts.map(&:media).compact.count).to be > 1
        end
      end
    end
  end
end
