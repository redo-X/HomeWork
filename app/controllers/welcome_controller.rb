class WelcomeController < ApplicationController


  def index
    @production_orders = ProductionOrder.all
  end
end
