class PostsController < ApplicationController
  def new #inicializar articulo
    @post = Post.new
  end
  
  def create
    #render plain: params[:post].inspect
    @post = Post.new(post_params)
    @post.save
    redirect_to articles_show(article_params)
  end
  
  private
    def post_params
      params.require(:post).permit(:titulo, :descripcion)
    end
end