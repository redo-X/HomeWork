class ProductionRecordAssistantController < ApplicationController

  def index

    if current_user.has_started_record
      redirect_to my_production_records_path, alert: t('.record_tracking_already_started')
    end

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

    production_record = ProductionRecord.new
    production_record.production_order = @production_order
    production_record.production_work_step = @production_work_step
    production_record.user = current_user
    production_record.start = Time.now

    respond_to do |format|
      if production_record.save
        format.html { redirect_to my_production_records_path, notice: t('helpers.flashes.created', :model => ProductionRecord.model_name.human.titleize) }
      end
    end
  end

  def finish_work

    @production_record = ProductionRecord.where("user_id = ? AND finish IS NULL", current_user.id).first()

    if @production_record.present? == false
      redirect_to my_production_records_path, alert: t('.no_record_started')
    end

  end

  def finish_work_update

    @production_record = ProductionRecord.find(params[:production_record_id])

    quantity = 0

    begin
      quantity = Integer(params[:quantity])
    rescue
      flash[:alert] = "Menge muss eine Ganzzahl sein"
      render 'finish_work' and return
    end

    if quantity > @production_record.production_order.quantity
      flash[:alert] = "Menge darf die zu fertigende Menge von #{@production_record.production_order.quantity} nicht überschreiten"
      render 'finish_work' and return
    elsif quantity < 0
      flash[:alert] = "Menge darf nicht negativ sein"
      render 'finish_work' and return
    end

    # Speichert die Änderungen und schließt die offene Buchung
    @production_record.finish = Time.now
    @production_record.quantity = params[:quantity]

    if @production_record.save
      redirect_to my_production_records_path, notice: t('.record_successfully_closed')
    end
  end

end
