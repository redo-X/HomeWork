class ProductionRecordAssistantController < ApplicationController

  def index

    @production_orders = ProductionOrder.joins(:article).all
    @production_work_steps = {}

  end

  def production_order_select
    @production_order = ProductionOrder.find(params[:production_order])
    @production_work_steps = @production_order.production_work_steps

    respond_to do |format|
      format.html { redirect_to production_record_assistant_path }
      format.js
    end
  end


  def production_work_step_select
    @production_order = ProductionOrder.find(params[:production_order])
    @production_work_step = ProductionWorkStep.find(params[:production_work_step])

    respond_to do |format|
      format.html { redirect_to production_record_assistant_path }
      format.js
    end
  end


  def work_details_input

  end

end
