class PostsController < ApplicationController
  def new #inicializar articulo
    @post = Post.new
  end
  
  def create
    #render plain: params[:post].inspect
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "El post se creo satisfactoriamente"
      redirect_to posts_path(@post)
    else
      render 'new'
    end
    
  end
  
  def show
    @post = Post.find(param[:id]) #aqui mostramos el id    
  end
  
  private
    def post_params
      params.require(:post).permit(:titulo, :descripcion)
    end
end