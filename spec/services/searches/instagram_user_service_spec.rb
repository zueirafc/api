require 'rails_helper'
require 'hashie'

module Searches
  RSpec.xdescribe InstagramUserService, type: :service do
    subject { described_class }

    context 'class methods' do
      it { is_expected.to respond_to(:make_a_item_by) }
      it { is_expected.to respond_to(:find_media_items_for) }
    end

    describe '.find_media_items_for' do
      xit 'needs to return the crawled items from web' do
        event = create :event, hash_tag: '#justin',
                               services: [ServiceKind::INSTAGRAM]

        expect(event.items.count).to eq(0)

        subject.find_media_items_for(event)

        expect(event.items.count).to eq(100)
      end
    end

    describe '.make_a_item_by' do
      let(:media_item) do
        Hashie::Mash.new(id: '596008529309278208',
                         caption: { text: 'a caption text for image' },
                         user: {
                           id: '1831819079',
                           username: 'brunoocasali',
                           full_name: 'Bruno Casali'
                         })
      end
      let(:invalid_media_item) { nil }

      context 'when media_item is valid' do
        it 'create a new valid Item' do
          last = subject.make_a_item_by(media_item)

          expect(media_item).to be_a(Hashie::Mash)
          expect(last).to be_a(Item)
          expect(last.author).to be_a(Author)
          expect(last).to_not be_nil
          expect(last.author).to_not be_nil
          expect(last.id).to eq(media_item.id)
          expect(last.text).to eq(media_item.caption.text)
          expect(last.status).to eq(ItemStatus::LISTED)
          expect(last.service).to eq(ServiceKind::INSTAGRAM)
        end
      end

      context 'when media_item is invalid' do
        it 'does not create a Item' do
          last = subject.make_a_item_by(invalid_media_item)

          expect(last).to be_nil
        end
      end
    end

    describe '.make_an_author_by' do
      let(:media_item) do
        Hashie::Mash.new(id: '596008529309278208',
                         caption: { text: 'a caption text for image' },
                         user: {
                           id: '1831819079',
                           username: 'brunoocasali',
                           full_name: 'Bruno Casali'
                         })
      end
      let(:invalid_media_item) { nil }

      context 'when media_item is valid' do
        it 'create a new valid Item' do
          author = subject.make_an_author_by(media_item.user)

          expect(author).to be_a(Author)
          expect(author).to_not be_nil
          expect(author.id).to eq(media_item.user.id.to_i)
          expect(author.screen_name).to eq("@#{media_item.user.username}")
          expect(author.service).to eq(ServiceKind::INSTAGRAM)
        end
      end

      # context 'when media_item is invalid' do
      #   it 'does not create a Item' do
      #     last = subject.make_an_author_by(invalid_media_item)
      #
      #     expect(last).to be_nil
      #   end
      # end
    end
  end
end
