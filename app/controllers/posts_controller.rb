class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show, :destroy]
  def new #inicializar articulo
    @post = Post.new
  end
  
  def index
    @posts = Post.all #obtener todos los articulos
  end
  
  def edit

  end
  
  def update
 #primero localizar el articulo
    if @post.update(post_params)
      flash[:success] = "El post se actualiza satisfactoriamente"
      redirect_to post_path(@post) 
      #render 'new'
    else
      render 'edit'
    end
  end
  
  def create
    #render plain: params[:post].inspect
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "El post se creo satisfactoriamente"
      redirect_to post_path(@post) 
      #render 'new'
    else
      render 'new'
    end 
  end
  
  def show
  #aqui mostramos el id    
  end
  
  def destroy
     #encontrar el articulo para eliminar
    @post.destroy
    
    redirect_to posts_path
    
    flash[:danger] = "El post se elimina satisfactoriamente"
  end
  
  private
    def set_post
      @post = Post.find(params[:id])
    end
  
    def post_params
      params.require(:post).permit(:titulo, :descripcion)
    end
end