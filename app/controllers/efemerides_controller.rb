class EfemeridesController < ApplicationController
  before_action :set_efemeride, only: %i[ show edit update destroy ]

  # GET /efemerides or /efemerides.json
  def index
    if params[:search].present? 
      @efemerides = Efemeride.where("categories ILIKE ?", "%#{params[:search]}%")
    else
      @efemerides = Efemeride.today
      #@efemerides = Efemeride.where(date: Date.today.all_day) 
    end
      #if params[:search].present?
      #  @efemerides = Efemeride.where("categories ILIKE ?", "%#{params[:search]}%")
      #end
  end

  # GET /efemerides/1 or /efemerides/1.json
  def show
  end

  # GET /efemerides/new
  def new
    @efemeride = Efemeride.new
  end

  # GET /efemerides/1/edit
  def edit
  end

  # POST /efemerides or /efemerides.json
  def create
    @efemeride = Efemeride.new(efemeride_params)

    respond_to do |format|
      if @efemeride.save
        format.html { redirect_to efemeride_url(@efemeride), notice: "Efemeride was successfully created." }
        format.json { render :show, status: :created, location: @efemeride }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @efemeride.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /efemerides/1 or /efemerides/1.json
  def update
    respond_to do |format|
      if @efemeride.update(efemeride_params)
        format.html { redirect_to efemeride_url(@efemeride), notice: "Efemeride was successfully updated." }
        format.json { render :show, status: :ok, location: @efemeride }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @efemeride.errors, status: :unprocessable_entity }
      end
    end
  end

  def find_schedules
    if start_params = params[:start_date] && end_params = params[:end_date]
     start_date = DateTime.new(start_params["year"].to_i, start_params["month"].to_i, start_params["day"].to_i)
     end_date = DateTime.new(end_params["year"].to_i, end_params["month"].to_i, end_params["day"].to_i)
     @efemerides = Efemeride.find(:all, :conditions => {:coursedate => start_date..end_date})  
    end
  end

  # DELETE /efemerides/1 or /efemerides/1.json
  def destroy
    @efemeride.destroy

    respond_to do |format|
      format.html { redirect_to efemerides_url, notice: "Efemeride was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_efemeride
      @efemeride = Efemeride.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def efemeride_params
      params.require(:efemeride).permit(:date, :categories, :comments, :photo)
    end
end
