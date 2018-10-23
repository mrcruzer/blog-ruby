class ArticlesController < ApplicationController

  before_action :set_articles, only: [:show, :edit]

    # El index mostrara, con all, Modelo
  def index
    @articles = Article.all
  end


  def show

    #Usaremos el metodo set_articles del before_action

  end



  def new

    @article = Article.new

  end



    # Metodo para crear
  def create
    @article = Article.new(article_params)

    if @article.save

      redirect_to @article

    else

      redirect_to :new
    end
  end



  def edit
        # Usaremos el metodo set_articles del before_action
  end


  # Metodo para actualizar
  def update

    @article = Article.find(params[:id])


    if @article = Article.update(article_params)

      redirect_to article_path

    else
      redirect_to :new
    end


    
  end


  

    # Metodo Reutilizable
  def set_articles

    @article = Article.find(params[:id])

  end


  private
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
