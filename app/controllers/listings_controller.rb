class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  # GET /listings
  # GET /listings.json
  def index
@listings = Listing.all

@listings = Listing.page(params[:page])
  end

  def search
    @listings =Listing.start_with(params[:search][:generic])
    @listings = @listings.page(params[:page])
    PKPKP

     
    
    render 'index'
   
  end
  def search_ajax
    # @listings = Listing.page(params[:page])

    @listings =@listings.general(params[:search_ajax][:general])
        respond_to do |format|
        format.js {render :json => @listings }
      end
    
    end
  def price_asc
    @listings = Listing.page(params[:page])
    @listings =@listings.order('price asc')
    render 'index'
   
  end
  def price_desc
    @listings = Listing.page(params[:page])
    @listings =@listings.order('price desc')
    render 'index'
   
  end
  
  
    # GET /listings/1
  # GET /listings/1.json
  def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit

  end

  # POST /listings
  # POST /listings.json


  def create
    
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id
    @listing.save
    redirect_to listings_path
    

  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      
      if @listing.update(listing_params)
        format.html { redirect_to listings_path, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:user_id, :title, :remove_image, :image_cache, :address ,:remote_image_url, :price, :feature, :num_room, :num_bed, :num_bath, :num_people, :image,{attachments:[]})
    end
end


