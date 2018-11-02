class ArticlesController < ApplicationController
      # ArticlesController esta heredando de ApplicationController

  before_action :set_articles, only: [:show, :edit, :update, :destroy]
    # Solo usara el metodo set_articles donde se le indique

    before_action :authenticate_editor!, only: [:new, :create, :update, :edit]

    before_action :authenticate_admin!, only: [:destroy]

    # Metodo para hacer busquedas
  def search
    if params[:titulo]

      @articles = Article.titulo(params[:titulo])

    else

      @articles = Article.all

    end
  end

    # El index mostrara, con all, Modelo
  def index

      @articles = Article.ultimos

      # Si el usuario esta logeado y es admin mostrara esta vista
    if user_signed_in? && current_user.is_editor? && !params.has_key?(:user_normal)
    
    
      render "admin_article"

    end
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

    if params[:categories].nil?
      redirect_to new_article_path, warning: "Debes seleccionar minimo una categoria"
    
    else
      @article = current_user.articles.new(article_params)
          # current_user = detecta si el usuario esta logeado

      @article.categories = params[:categories]

      respond_to do |format|
        if @article.save
          format.html { redirect_to @article, warning: "Articulo Creado" }
          format.json { render :show, status: :created, location: @article}
        else
          format.html {render 'new'}
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
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

    format.html { redirect_to articles_path, warning: "Articulo borrado" }
    format.json { head :no_content }

    end


  end


  # Metodo para actualizar
  def update

    #usara el set_articles, Primero

    respond_to do |format|

      if @article.update(article_params)

        format.html{ redirect_to article_path, warning: "Articulo Actualizado"}
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
