class TreksController < ApplicationController
  before_action :set_trek, only: [:show, :edit, :update, :destroy]
  before_action :require_login

  # GET /treks
  # GET /treks.json
  def index
    @treks = current_user.treks.order(:date)
  end

  # GET /treks/1
  # GET /treks/1.json
  def show
  end

  # GET /treks/new
  def new
    @trek = current_user.treks.new
    flash[:notice] = "Ooops! Hikes can only be entered during the Challenge." unless Unit.first.active?
  end

  # GET /treks/1/edit
  def edit
  end

  # POST /treks
  # POST /treks.json
  def create
    @trek = current_user.treks.new(trek_params)

    if @trek.save
      redirect_to user_treks_path(current_user), notice: 'Hike was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /treks/1
  # PATCH/PUT /treks/1.json
  def update
    if @trek.update(trek_params)
      redirect_to user_treks_path(current_user), notice: 'Hike was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /treks/1
  # DELETE /treks/1.json
  def destroy
    @trek.destroy
    respond_to do |format|
      format.html { redirect_to treks_url, notice: 'Trek was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trek
      @trek = Trek.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trek_params
      params.require(:trek).permit(:user_id, :date, :distance_in_miles)
    end
end
