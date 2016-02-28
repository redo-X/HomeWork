class WelcomeController < ApplicationController

  def index
    @favorites = current_user.favorites
    @production_records = current_user.production_records
  end
end
