class Admin::ProductsController < ApplicationController
  before_action :set_product_type
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.where(product_type: @product_type)
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params.merge(product_type_id: @product_type.id))

    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_product_url(@product, product_type_slug: @product_type.slug), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to admin_product_url(@product, product_type_slug: @product_type.slug), notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def set_product_type
      @product_type = ProductType.find_by!(slug: params[:product_type_slug])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params
        .fetch(:product, {})
        .permit(:name, :slug, :numbers, :strings)
        .merge(numbers: product_numbers_params)
    end

    def product_numbers_params
      params.require(:product).permit(numbers: {}).to_h[:numbers].map do |k, v|
        [k, v.to_f]
      end.to_h
    end
end
