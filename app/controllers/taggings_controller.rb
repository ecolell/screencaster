class TaggingsController < ApplicationController
  before_action :set_tagging, only: [:show, :edit, :update, :destroy]

  # GET /taggings
  def index
    @taggings = Tagging.all
  end

  # GET /taggings/1
  def show
  end

  # GET /taggings/new
  def new
    @tagging = Tagging.new
  end

  # GET /taggings/1/edit
  def edit
  end

  # POST /taggings
  def create
    @tagging = Tagging.new(tagging_params)

    if @tagging.save
      redirect_to @tagging, notice: 'Tagging was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /taggings/1
  def update
    if @tagging.update(tagging_params)
      redirect_to @tagging, notice: 'Tagging was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /taggings/1
  def destroy
    @tagging.destroy
    redirect_to taggings_url, notice: 'Tagging was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tagging
      @tagging = Tagging.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tagging_params
      params.require(:tagging).permit(:tag_id, :episode_id)
    end
end
