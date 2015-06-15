class CommentsController < ApplicationController
  def index
    if params[:user_id]
      user = User.find(params[:user_id])
      render json: user.comments.all
    elsif params[:contact_id]
      contact = Contact.find(params[:contact_id])
      render json: contact.comments.all
    end
  end

  def create
    if params[:user_id]
      user = User.find(params[:user_id])
      comment = Comment.new(
                            commentable_type: "User",
                            commentable_id: params[:user_id],
                            content: params[:comment][:content]
                            )
    elsif params[:contact_id]
      comment = Comment.new(
                            commentable_type: "Contact",
                            commentable_id: params[:contact_id],
                            content: params[:comment][:content]
                            )
    end

    if comment.save
      render json: comment
    else
      render(
        json: comment.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment
      comment.destroy
      render json: comment
    else
      render(
        json: comment.errors.full_messages, status: :unprocessable_entity
      )
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
