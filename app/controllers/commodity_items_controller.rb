class CommodityItemsController < ApplicationController
  before_action :login_required
  before_action :set_commodity_item, only: [:show, :edit, :update, :destroy]

  # GET /commodity_items
  # GET /commodity_items.json
  def index
#    @commodity_items = CommodityItem.all
    @commodity_items = current_company.commodity_items
  end

  # GET /commodity_items/1
  # GET /commodity_items/1.json
  def show
  end

  # GET /commodity_items/new
  def new
    @commodity_item = CommodityItem.new
  end

  # GET /commodity_items/1/edit
  def edit
  end

  # POST /commodity_items
  # POST /commodity_items.json
  def create
    @commodity_item = CommodityItem.new(commodity_item_params)

    respond_to do |format|
      if @commodity_item.save
#        CommodityItemsChannel.broadcast(@commodity_item)
        format.html { redirect_to edit_transaction_path(@commodity_item.txn), notice: 'Commodity item was successfully created.' }
        format.json { render :show, status: :created, location: @commodity_item }
      else
        format.html { render :new }
        format.json { render json: @commodity_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /commodity_items/1
  # PATCH/PUT /commodity_items/1.json
  def update
    respond_to do |format|
      if @commodity_item.update(commodity_item_params)
        format.html { redirect_to @commodity_item, notice: 'Commodity item was successfully updated.' }
        format.json { render :show, status: :ok, location: @commodity_item }
      else
        format.html { render :edit }
        format.json { render json: @commodity_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commodity_items/1
  # DELETE /commodity_items/1.json
  def destroy
    @transaction = @commodity_item.txn
    @commodity_item.destroy
    respond_to do |format|
      format.html { redirect_to edit_transaction_path(@transaction), notice: 'Commodity item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commodity_item
      @commodity_item = CommodityItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def commodity_item_params
      params.require(:commodity_item).permit(:gross, :tare, :price, :total, :commodity_id, :transaction_id)
    end
end
