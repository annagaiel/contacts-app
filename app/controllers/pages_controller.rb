class PagesController < ApplicationController

  def index
    p params
    if current_user
      @contacts = current_user.contacts
    else
      @contacts = Contact.all
      search = params[:search]
      if search.nil? == false
        @contacts = Contact.where("first_name LIKE ? OR last_name LIKE ? ", "%#{search}%", "%#{search}%")
      end
    end
  end

  def new
  end

  def show
    @contact = Contact.find_by(id: params[:id])
  end

  def edit
    @contact = Contact.find_by(id: params[:id])
  end

  def create
    coordinates = Geocoder.coordinates(params[:address])
    @new_contact = Contact.new(first_name: params[:first_name], middle_name:params[:middle_name],
    last_name: params[:last_name], email: params[:email], phone_number: params[:phone_number],
    address: params[:address], latitude: coordinates[0], longitude: coordinates[1])
    @new_contact.save
    if @new_contact.valid?
      redirect_to root_path
    end
  end

  def update
    coordinates = Geocoder.coordinates(params[:address])
    @contact = Contact.find_by(id: params[:id])
    @contact.update_attributes(first_name: params[:first_name], middle_name:params[:middle_name],
    last_name: params[:last_name], email: params[:email], phone_number: params[:phone_number],
    address: params[:address], latitude: coordinates[0], longitude: coordinates[1])
    redirect_to root_path
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    redirect_to root_path
  end

  def all_marks
     @all_marks = Contact.all_marks
  end
end
