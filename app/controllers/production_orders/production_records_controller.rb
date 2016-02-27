class ProductionOrders::ProductionRecordsController < ApplicationController

  # GET /production_records
  # GET /production_records.json
  def index
    @production_records = ProductionRecord.where("production_order_id = ?", params[:production_order_id])
  end

  def my_work
    @production_records = current_user.production_records
  end

end
