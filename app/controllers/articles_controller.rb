class ArticlesController < ApplicationController
      # ArticlesController esta heredando de ApplicationController

  before_action :set_articles, only: [:show, :edit, :update, :destroy]
    # Solo usara el metodo set_articles donde se le indique

    before_action :authenticate_editor!, only: [:new, :create, :update, :edit]

    before_action :authenticate_admin!, only: [:destroy]



    # El index mostrara, con all, Modelo
  def index
    @articles = Article.all
  end


  def show

    #Usaremos el metodo set_articles del before_action

  end



  def new

    @article = Article.new

    @categories = Category.all

  end



    # Metodo para crear
  def create
    @article = current_user.articles.new(article_params)
        # current_user = detecta si el usuario esta logeado

    @article.categories = params[:categories]

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: "Articulo Creado" }
        format.json { render :show, status: :created, location: @article}
      else
        format.html {render 'new'}
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end



  def edit
        # Usaremos el metodo set_articles del before_action
  end


  # Metodo para borrar
  def destroy

    #usara el set_articles, Primero

    @article.destroy

    respond_to do |format|

    format.html { redirect_to articles_path }
    format.json { head :no_content }

    end


  end


  # Metodo para actualizar
  def update

    #usara el set_articles, Primero

    respond_to do |format|

      if @article.update(article_params)

        format.html{ redirect_to article_path, notice: "Articulo Actualizado"}
        format.json { render :show, status: :created, location: @article}

      else

        format.html { redirect_to 'edit' }
        format.json { render json: @article.errors, status: :unprocessable_entity }

      end
    end

  end


  

    # Metodo Reutilizable
  def set_articles

    @article = Article.find(params[:id])

  end


  private
  def article_params
    params.require(:article).permit(:title, :body, :categories)
  end
end
