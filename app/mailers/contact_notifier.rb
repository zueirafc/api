class ContactNotifier < ApplicationMailer
  def new_contact_from_site(contact)
    @contact = contact

    mail(to: @contact.category.email, from: @contact.email,
         subject: @contact.category.name)
  end
end
