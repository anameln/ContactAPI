class ContactsController < ApplicationController

  def index
    user = User.find(params[:user_id])

    render json: user.contacts
  end

  def create
    raise "Must provide user id." if params[:id].nil?
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    contact = Contact.find(params[:id])
    if contact
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def update
    contact = Contact.find(params[:id])
    contact.update(contact_params)
    if contact.save
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    if contact
      contact.destroy
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end

  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end
end
