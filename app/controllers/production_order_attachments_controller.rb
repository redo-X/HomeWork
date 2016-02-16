class ProductionOrderAttachmentsController < ApplicationController
  def index
    @production_order_attachment = ProductionOrderAttachment.all
  end

  def new
    @production_order_attachment = ProductionOrderAttachment.new
  end

  def create
    @production_order_attachment = ProductionOrderAttachment.new(production_order_attachments_params)

    if @production_order_attachment.save
      redirect_to production_order_attachments_path, notice: "The attachement #{@production_order_attachment.name} has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    @production_order_attachment = ProductionOrderAttachment.find(params[:id])
    @production_order_attachment.destroy
    redirect_to production_order_attachments_path, notice:  "The attachement #{@production_order_attachment.name} has been deleted."
  end

  private
  def production_order_attachments_params
    params.require(:production_order_attachment).permit(:name, :attachment)
  end
end