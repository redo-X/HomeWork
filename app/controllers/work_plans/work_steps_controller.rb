class WorkPlans::WorkStepsController < ApplicationController
  before_action :set_work_step, only: [:edit, :update, :destroy]


  # GET /work_steps/new
  def new
    @work_plan = WorkPlan.find(params[:work_plan_id])

    @work_step = WorkStep.new
    @work_step.work_plan=@work_plan
  end

  # GET /work_steps/1/edit
  def edit

  end

  # POST /work_steps
  # POST /work_steps.json
  def create
    @work_plan = WorkPlan.find(params[:work_plan_id])
    @work_step = WorkStep.new(work_step_params)
    @work_step.work_plan=@work_plan

    respond_to do |format|
      if @work_step.save
        format.html { redirect_to @work_plan, notice: 'Work step was successfully created.' }
        format.json { render :show, status: :created, location: @work_plan }
      else
        format.html { render :new }
        format.json { render json: @work_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_steps/1
  # PATCH/PUT /work_steps/1.json
  def update
    respond_to do |format|
      if @work_step.update(work_step_params)
        format.html { redirect_to @work_plan, notice: 'Work step was successfully updated.' }
        format.json { render :show, status: :ok, location: @work_plan }
      else
        format.html { render :edit }
        format.json { render json: @work_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_steps/1
  # DELETE /work_steps/1.json
  def destroy
    title = @work_step.name

    if @work_step.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."

      redirect_to @work_plan
    else
      flash[:error] = "\"#{title}\" was not deleted due an error."
      render :show
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_work_step
    @work_step = WorkStep.find(params[:id])
    @work_plan = @work_step.work_plan
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def work_step_params
    params.require(:work_step).permit(:name)
  end
end
