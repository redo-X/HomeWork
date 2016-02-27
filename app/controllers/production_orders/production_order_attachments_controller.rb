class ProductionOrders::ProductionOrderAttachmentsController < ApplicationController
  before_action :set_production_order_attachment, only: [:edit, :update, :destroy]

  def new
    @production_order = ProductionOrder.find(params[:production_order_id])

    @production_order_attachment = ProductionOrderAttachment.new
    @production_order_attachment.production_order = @production_order
  end

  def create
    @production_order = ProductionOrder.find(params[:production_order_id])
    @production_order_attachment = ProductionOrderAttachment.new(production_order_attachments_params)
    @production_order_attachment.production_order = @production_order

    respond_to do |format|
      if @production_order_attachment.save
        format.html { redirect_to edit_production_order_path(@production_order), notice: "The attachement #{@production_order_attachment.name} has been uploaded." }
        format.json { render :show, status: :created, location: @production_order }
      else
        format.html { render :new }
        format.json { render json: @production_order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    title = @production_order_attachment.name

    if @production_order_attachment.destroy
      flash[:notice] = t('helpers.flashes.destroyed', :model => ProductionOrderAttachment.model_name.human.titleize)

      redirect_to edit_production_order_path(@production_order)
    else
      flash[:error] = "\"#{title}\" was not deleted due an error."
      render :show
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_production_order_attachment
    @production_order_attachment = ProductionOrderAttachment.find(params[:id])
    @production_order = @production_order_attachment.production_order
  end

  private
  def production_order_attachments_params
    params.require(:production_order_attachment).permit(:name, :attachment)
  end
end