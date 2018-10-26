class WelcomeController < ApplicationController
    # WelcomeController esta heredando de ApplicationController

    def index

        @articles = Article.all

    end

    def contactos
        @email = "isaac@gmail.com"
            #variable global
    end
    
end