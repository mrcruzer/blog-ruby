class ContactsController < ApplicationController

    def create
        @contact = Contact.new(contacts_params)

        respond_to do |format|
            if @contact.save
                InfoMailer.form_contact(@contact).deliver_now
              format.html { redirect_to root_path, warning: "Mensaje Enviado" }
              format.json { render :show, status: :created, location: @contact}
            else
              format.html {render :new}
              format.json { render json: @contact.errors, status: :unprocessable_entity }
            end
        end
    end

    def new
        @contact = Contact.new
    end

    private
    def contacts_params
        params.require(:contact).permit(:name, :email, :description)  
    end

end