require 'rails_helper'

module Searches
  RSpec.describe FacebookPageService, type: :service do
    subject { described_class }

    context 'class methods' do
      it { is_expected.to respond_to(:find_posts_for) }
    end

    let!(:params) { { key: '14725847638546', kind: SourceKind::FACEBOOK_PAGE } }
    let!(:source) { create :source, params }
    let!(:json) do
      File.read("#{Rails.root}/spec/support/requests/fb/response.json")
    end

    describe '.find_posts_for' do
      before { FakeWeb.register_uri(:get, /graph.facebook.com/, body: json) }

      it 'needs to return the maximum of crawled items from web' do
        expect(source.microposts.count).to eq(0)

        subject.find_posts_for(source)

        expect(source.microposts.count).to eq(5)
      end

      it 'add troller from source' do
        subject.find_posts_for(source)

        club = source.troller
        club_from_post = source.last.trollers.first.trollerable

        expect(club).to eq(club_from_post)
      end

      it 'attach to post media' do
        subject.find_posts_for(source)

        expect(source.microposts.map(&:media).compact.count).to eq(5)
      end

      xit 'attach video to post' do
        expect do
          subject.find_posts_for(source)
        end.to change(Medium.video, :count).by(1)
      end
    end
  end
end
