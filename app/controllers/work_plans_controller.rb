class WorkPlansController < ApplicationController
  before_action :set_work_plan, only: [:show, :edit, :update, :destroy]


  # GET /work_plans
  # GET /work_plans.json
  def index
    @work_plans = WorkPlan.all
  end

  # GET /work_plans/1
  # GET /work_plans/1.json
  def show
    @work_steps = @work_plan.work_steps
  end

  # GET /work_plans/new
  def new
    @work_plan = WorkPlan.new
  end

  # GET /work_plans/1/edit
  def edit
  end

  # POST /work_plans
  # POST /work_plans.json
  def create

    @work_plan = WorkPlan.new(work_plan_params)

    sourceWorkPlan = WorkPlan.find_by(id: params[:source_work_plan])

    if sourceWorkPlan.present?
      sourceWorkPlan.work_steps.each do |ws|
        newWorkStep = WorkStep.new
        newWorkStep.name = ws.name
        @work_plan.work_steps << newWorkStep
      end
    end

    respond_to do |format|
      if @work_plan.save
        format.html { redirect_to @work_plan, notice: 'Work plan was successfully created.' }
        format.json { render :show, status: :created, location: @work_plan }
      else
        format.html { render :new }
        format.json { render json: @work_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_plans/1
  # PATCH/PUT /work_plans/1.json
  def update
    respond_to do |format|
      if @work_plan.update(work_plan_params)
        format.html { redirect_to @work_plan, notice: 'Work plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @work_plan }
      else
        format.html { render :edit }
        format.json { render json: @work_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_plans/1
  # DELETE /work_plans/1.json
  def destroy
    @work_plan.work_steps.destroy_all
    @work_plan.destroy
    respond_to do |format|
      format.html { redirect_to work_plans_url, notice: 'Work plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_plan
      @work_plan = WorkPlan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_plan_params
      params.require(:work_plan).permit(:name, :description, :is_standard)
    end
end
