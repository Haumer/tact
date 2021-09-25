class ContactsController < ApplicationController
  before_action :find_contact, only: [:edit, :update]
  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user = current_user
    if @contact.save
      redirect_back(fallback_location: user_contacts_path(user: current_user))
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @contact.update(contact_params)
      redirect_back(fallback_location: user_contacts_path(user: current_user))
    else
      render :edit
    end
  end

  private

  def find_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :contact_frequency)
  end
end
