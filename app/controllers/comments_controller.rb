class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find_by(params[:id])
    @comment = @post.comments.build(comment_params)

    if @comment.save
      redirect_to request.refferer
      flash[:notice] = "Comment posted."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :commenter_id)
  end
end
