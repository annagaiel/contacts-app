class PagesController < ApplicationController

  def index
    @contacts = User.all
    search = params[:search]
    if search.nil? == false
      @contacts = User.where("first_name LIKE ? OR last_name LIKE ? ", "%#{search}%", "%#{search}%")
    end
  end

  def new
  end

  def show
    @contact = User.find_by(id: params[:id])
  end

  def edit
    @contact = User.find_by(id: params[:id])
  end

  def create
    coordinates = Geocoder.coordinates(params[:address])
    @new_contact = User.new(first_name: params[:first_name], middle_name:params[:middle_name],
    last_name: params[:last_name], email: params[:email], phone_number: params[:phone_number],
    address: params[:address], latitude: coordinates[0], longitude: coordinates[1])
    @new_contact.save
    if @new_contact.valid?
      redirect_to root_path
    end
  end

  def update
    coordinates = Geocoder.coordinates(params[:address])
    @contact = User.find_by(id: params[:id])
    @contact.update_attributes(first_name: params[:first_name], middle_name:params[:middle_name],
    last_name: params[:last_name], email: params[:email], phone_number: params[:phone_number],
    address: params[:address], latitude: coordinates[0], longitude: coordinates[1])
    redirect_to root_path
  end

  def destroy
    @contact = User.find_by(id: params[:id])
    @contact.destroy
    redirect_to root_path
  end

  def all_marks
     @all_marks = User.all_marks
  end
end
