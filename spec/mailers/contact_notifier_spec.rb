require 'rails_helper'

RSpec.describe ContactNotifier, type: :mailer do
  describe '#new_contact_from_site' do
    let(:contact) { build :contact }
    let(:mail) { described_class.new_contact_from_site(contact).deliver_now }

    it 'renders the subject' do
      expect(mail.subject).to eq(contact.category.name)
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([contact.category.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq([contact.email])
    end

    it 'assigns @name' do
      expect(mail.body.encoded).to match(contact.name)
    end
  end
end
