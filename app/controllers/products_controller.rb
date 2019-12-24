class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource

  # GET /products
  # GET /products.json
  def index
    if params[:q]
      search_term = params[:q]
      @products = Product.search(search_term)
      #return our filtered list here
    else
      @products = Product.all
    end
  end

  def new
    @product = Product.new    
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @comments = @product.comments.order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    respond_to do |format|

      if @product.save
        $redis.set("product:#{@product.id}", Marshal.dump(@product))
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
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
        $redis.set("product:#{@product.id}", Marshal.dump(@product))
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
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
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    product_id = params[:id]
    product_cache = $redis.get("product:#{product_id}")

    if product_cache
      puts 'Loaded product from cache'
      @product = Marshal.load(product_cache)
    else
      puts 'Loaded product from database'
      @product = Product.find(product_id)
      $redis.set("product:#{@product.id}", Marshal.dump(@product))
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:name, :description, :image_url, :color, :colour, :price)
  end
end
