class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
    @client_token = Braintree::ClientToken.generate
    @listing = Listing.find_by(id: params[:listing_id])
    @reservation = Reservation.find_by(id: params[:id])

  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
    @listing = Listing.find_by(id: params[:listing_id])

  end
  def checkout
    @reservation = Reservation.find_by(id: params[:id])
    nonce_from_the_client = params[:checkout_form][:payment_method_nonce]
    result = Braintree::Transaction.sale(
     :amount => Reservation.find_by(id: params[:id]).price, #this is currently hardcoded
     :payment_method_nonce => nonce_from_the_client,
     :options => {
        :submit_for_settlement => true
      }
     )
  
    if result.success?
    byebug
      @reservation.update(payment :1)
      UserMailer.signup_confirmation(@reservation).deliver_now

      redirect_to :root, :flash => { :success => "Transaction successful!" }
    else

      redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
    end
  end
  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    
    @reservation = Reservation.new(reservation_params)
    @reservation.payment=1
    @reservation.user_id = current_user.id
    @reservation.listing_id=Listing.find_by(id: params[:listing_id]).id
   if @reservation.save
    redirect_to listing_reservation_path(:id=>@reservation.id)
   else 
    redirect_to new_listing_reservation_path
  end
end
  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
    params.require(:reservation).permit(:user_id, :reserve_from,:payment, :price, :reserve_until, :listing_id)
  end
end
