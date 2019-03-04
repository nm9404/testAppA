class PostsController < ApplicationController
  def new #inicializar articulo
    @post = Post.new
  end
  
  def index
    @posts = Post.all #obtener todos los articulos
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id]) #primero localizar el articulo
    if @post.update(post_params)
      flash[:notice] = "El post se actualiza satisfactoriamente"
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
      flash[:notice] = "El post se creo satisfactoriamente"
      redirect_to post_path(@post) 
      #render 'new'
    else
      render 'new'
    end 
  end
  
  def show
    @post = Post.find(params[:id]) #aqui mostramos el id    
  end
  
  def destroy
    @post = Post.find(params[:id]) #encontrar el articulo para eliminar
    @post.destroy
    
    redirect_to posts_path
    
    flash[:notice] = "El post se elimina satisfactoriamente"
  end
  
  private
    def post_params
      params.require(:post).permit(:titulo, :descripcion)
    end
end