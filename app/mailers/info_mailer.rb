class InfoMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.info_mailer.form_contact.subject
  #
  def form_contact(contact)
    # @correo = Contact.find(contacto.id)

    @contact = contact

    @subject = "Mensaje De Contacto"

    mail(to: "isaacavelino14@gmail.com", subject: @subject)
  end
end
