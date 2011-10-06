class CommentsController < ApplicationController
  before_filter :authenticate  , :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy

  def new
  end

  def create
          @post = Micropost.find_by_id(params[:mp_id])
    @comment  = @post.comments.build(params[:comment])
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to root_path
    else
       @feed_items = []
      flash[:error] = "Failed"
      redirect_to root_path
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = "Comment Deleted!"
    redirect_back_or root_path
  end

  private
    def authorized_user
      @comment = current_user.comments.find_by_id(params[:id])
      redirect_to root_path if @comment.nil?
    end

end
