class WelcomeController < ApplicationController
    # WelcomeController esta heredando de ApplicationController

    def index

        @articles = Article.all

    end

    def contacto
        @contacts = Contact.new
            #variable global
    end
    
end