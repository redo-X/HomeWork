class ProductionOrders::ProductionWorkStepsController < ApplicationController
  before_action :set_production_work_step, only: [:edit, :update, :destroy]


  def new
    @production_order = ProductionOrder.find(params[:production_order_id])

    @production_work_step = ProductionWorkStep.new
    @production_work_step.production_order = @production_order
  end


  def edit
  end


  def create
    @production_order = ProductionOrder.find(params[:production_order_id])

    @production_work_step = ProductionWorkStep.new(production_work_step_params)
    @production_work_step.production_order = @production_order

    respond_to do |format|
      if @production_work_step.save
        format.html { redirect_to edit_production_order_path(@production_order), notice: 'Work step was successfully created.' }
        format.json { render :show, status: :created, location: @production_order }
      else
        format.html { render :new }
        format.json { render json: @production_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /production_work_steps/1
  # PATCH/PUT /production_work_steps/1.json
  def update
    respond_to do |format|
      if @production_work_step.update(production_work_step_params)
        format.html { redirect_to @production_work_step, notice: 'Production work step was successfully updated.' }
        format.json { render :show, status: :ok, location: @production_work_step }
      else
        format.html { render :edit }
        format.json { render json: @production_work_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /production_work_steps/1
  # DELETE /production_work_steps/1.json
  def destroy
    title = @production_order.display_name

    if @production_work_step.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."

      redirect_to edit_production_order_path(@production_order)
    else
      flash[:error] = "\"#{title}\" was not deleted due an error."
      render :show
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_production_work_step
      @production_order = ProductionOrder.find(params[:production_order_id])
      @production_work_step = ProductionWorkStep.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def production_work_step_params
      params.require(:production_work_step).permit(:name)
    end
end
