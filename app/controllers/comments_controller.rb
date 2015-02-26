class CommentsController < ApplicationController
  def index

  end

  def create
    @commentable = find_commentable
    @comments = @commentable.comments
    @comment = Comment.new params.require(:comment).permit(:content) #comment.content: "   "
    if @comment.save
      @commentable.comments << @comment
      flash[:notice] = "Successfully saved comment."
      redirect_to @commentable
    else
      p @comment
      redirect_to @commentable
    end

  end

  def find_commentable
  params.each do |name, value|
    if name =~ /(.+)_id$/
      return $1.classify.constantize.find(value)
    end
  end
  nil
  end
end

