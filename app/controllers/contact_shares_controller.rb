class ContactSharesController < ApplicationController
  def create
    share = ContactShare.new(shared_params)
    if share.save
      render json: share
    else
      json: share.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    share = ContactShare.find(params[:id])
    if share
      share.destroy
      render json: share
    else
      json: share.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def shares_params
    params.require(:contact_share).permit(:user_id, :contact_id)
  end
end
