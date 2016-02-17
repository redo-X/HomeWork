class ProductionRecordsController < ApplicationController
  before_action :set_production_record, only: [:show, :edit, :update, :destroy]

  # GET /production_records
  # GET /production_records.json
  def index
    @production_records = ProductionRecord.all
  end

  # GET /production_records/1
  # GET /production_records/1.json
  def show
  end

  # GET /production_records/new
  def new
    @production_record = ProductionRecord.new
  end

  # GET /production_records/1/edit
  def edit
  end

  # POST /production_records
  # POST /production_records.json
  def create
    @production_record = ProductionRecord.new(production_record_params)

    respond_to do |format|
      if @production_record.save
        format.html { redirect_to @production_record, notice: 'Production record was successfully created.' }
        format.json { render :show, status: :created, location: @production_record }
      else
        format.html { render :new }
        format.json { render json: @production_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /production_records/1
  # PATCH/PUT /production_records/1.json
  def update
    respond_to do |format|
      if @production_record.update(production_record_params)
        format.html { redirect_to @production_record, notice: 'Production record was successfully updated.' }
        format.json { render :show, status: :ok, location: @production_record }
      else
        format.html { render :edit }
        format.json { render json: @production_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /production_records/1
  # DELETE /production_records/1.json
  def destroy
    @production_record.destroy
    respond_to do |format|
      format.html { redirect_to production_records_url, notice: 'Production record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_production_record
      @production_record = ProductionRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def production_record_params
      params.require(:production_record).permit(:start, :finish, :quantity)
    end
end
