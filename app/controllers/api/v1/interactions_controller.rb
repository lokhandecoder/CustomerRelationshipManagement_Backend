class Api::V1::InteractionsController < ApplicationController
  before_action :set_api_v1_interaction, only: %i[ show update destroy ]

  # GET /api/v1/interactions
  def index
    @api_v1_interactions = Interaction.all

    render json: @api_v1_interactions
  end

  # GET /api/v1/interactions/1
  def show
    render json: @api_v1_interaction
  end

  #POST /api/v1/interactions
  def create
    @api_v1_interaction = Interaction.new(api_v1_interaction_params)
  
    if @api_v1_interaction.save
      render json: @api_v1_interaction, status: :created
    else
      render json: @api_v1_interaction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/interactions/1
  def update
    if @api_v1_interaction.update(api_v1_interaction_params)
      render json: @api_v1_interaction
    else
      render json: @api_v1_interaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/interactions/1
  def destroy
    @api_v1_interaction.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_interaction
      @api_v1_interaction = Interaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_interaction_params
      params.require(:interaction).permit(:content, :contact_id)
    end
end
