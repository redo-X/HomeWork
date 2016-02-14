class ProductionOrdersController < ApplicationController
  before_action :set_production_order, only: [:show, :edit, :update, :destroy]

  # GET /production_orders
  # GET /production_orders.json
  def index
    @production_orders = ProductionOrder.all
  end

  # GET /production_orders/new
  def new
    @production_order = ProductionOrder.new

    @production_order.quantity = 1
    @production_order.due_date = I18n.localize Date.today
    @production_order.release_date = I18n.localize Date.today

    if ProductionOrder.count.equal?(0)
      @production_order.number = 1000
    else
      @production_order.number = ProductionOrder.maximum(:number) + 1
    end
  end

  # GET /production_orders/1/edit
  def edit
  end

  # POST /production_orders
  # POST /production_orders.json
  def create
    @production_order = ProductionOrder.new(production_order_params)

    respond_to do |format|
      if @production_order.save
        format.html { redirect_to edit_production_order_path(@production_order), notice: 'Production order was successfully created.' }
        format.json { render :show, status: :created, location: @production_order }
      else
        format.html { render :new }
        format.json { render json: @production_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /production_orders/1
  # PATCH/PUT /production_orders/1.json
  def update
    respond_to do |format|
      if @production_order.update(production_order_params)
        format.html { redirect_to edit_production_order_path(@production_order), notice: 'Production order was successfully updated.' }
        format.json { render :show, status: :ok, location: @production_order }
      else
        format.html { render :edit }
        format.json { render json: @production_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /production_orders/1
  # DELETE /production_orders/1.json
  def destroy
    @production_order.destroy
    respond_to do |format|
      format.html { redirect_to production_orders_url, notice: 'Production order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_production_order
      @production_order = ProductionOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def production_order_params
      params.require(:production_order).permit(:number, :description, :quantity, :pending_quantity, :release_date,
                                               :due_date, :isCompleted, :article_id, :customer_id)
    end
end
