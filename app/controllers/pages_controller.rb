class PagesController < ApplicationController
  def details
    @users = User.all
  end

  def first_contact
    @user = User.first
  end
end
