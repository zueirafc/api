module V1
  class ContactsController < ApplicationController
    before_action :set_contact, only: [:show, :destroy, :read]

    def index
      @contacts = Contact.all

      respond_with :v1, @contacts
    end

    def show
      respond_with :v1, @contact
    end

    def create
      @contact = Contact.new(contact_params)
      @contact.unread!
      @contact.save

      ContactNotifier
        .new_contact_from_site(@contact).deliver_now if @contact.valid?

      respond_with :v1, @contact
    end

    def destroy
      @contact.destroy

      respond_with :v1, @contact
    end

    def read
      @contact.read!
      @contact.save

      respond_with :v1, @contact
    end

    private

    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact)
            .permit(:name, :email, :contact_category_id, :message)
    end
  end
end
