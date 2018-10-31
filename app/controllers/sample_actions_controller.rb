class SampleActionsController < ApplicationController
  before_action :set_sample_action, only: [:show, :edit, :update, :destroy]

  # GET /sample_actions
  # GET /sample_actions.json
  def index
    @sample_actions = SampleAction.all
  end

  # GET /sample_actions/1
  # GET /sample_actions/1.json
  def show
  end

  # GET /sample_actions/new
  def new
    @sample_action = SampleAction.new
  end

  # GET /sample_actions/1/edit
  def edit
  end

  # POST /sample_actions
  # POST /sample_actions.json
  def create
    @sample_action = SampleAction.new(sample_action_params)

    respond_to do |format|
      if @sample_action.save
        format.html { redirect_to @sample_action, notice: 'Sample action was successfully created.' }
        format.json { render :show, status: :created, location: @sample_action }
      else
        format.html { render :new }
        format.json { render json: @sample_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sample_actions/1
  # PATCH/PUT /sample_actions/1.json
  def update
    respond_to do |format|
      if @sample_action.update(sample_action_params)
        format.html { redirect_to @sample_action, notice: 'Sample action was successfully updated.' }
        format.json { render :show, status: :ok, location: @sample_action }
      else
        format.html { render :edit }
        format.json { render json: @sample_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sample_actions/1
  # DELETE /sample_actions/1.json
  def destroy
    @sample_action.destroy
    respond_to do |format|
      format.html { redirect_to sample_actions_url, notice: 'Sample action was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sample_action
      @sample_action = SampleAction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sample_action_params
      params.require(:sample_action).permit(:name, :age)
    end
end
