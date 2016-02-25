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
    @production_order = ProductionOrder.find(params[:production_order])
    @production_work_step = ProductionWorkStep.find(params[:production_work_step])
    @start = params[:start]
    @finish = params[:finish]

    production_record = ProductionRecord.new
    production_record.production_order = @production_order
    production_record.production_work_step = @production_work_step
    production_record.user = current_user
    production_record.start = @start
    production_record.finish = @finish
    production_record.quantity = 0

    respond_to do |format|
      if production_record.save
        format.html { redirect_to root_path, notice: 'Production record was successfully created.' }
      end
    end
  end

end
