class PagesController < ApplicationController
  def home
   if user_signed_in? 
   redirect_to users_path(current_user)
  end
end
end
