# frozen_string_literal: true

class UserDecisionsController < ApplicationController
  before_action :set_user_decision, only: %i[show edit update destroy]

  # GET /user_decisions
  def index
    @user_decisions = UserDecision.all
  end

  # GET /user_decisions/1
  def show; end

  # GET /user_decisions/new
  def new
    @user_decision = UserDecision.new
  end

  # GET /user_decisions/1/edit
  def edit; end

  # POST /user_decisions or /user_decisions.json
  def create
    @user_decision = UserDecision.new(user_decision_params)
    @user_decision.decision = DecisionTree::ModelTraining.call(customer_attributes)

    respond_to do |format|
      if @user_decision.save
        format.html do
          redirect_to user_decisions_path,
                      notice: "This customer should probably buy products related to: #{@user_decision.decision}"
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_decisions/1
  def update
    respond_to do |format|
      if @user_decision.update(user_decision_params)
        format.html { redirect_to user_decision_url(@user_decision), notice: "User decision was successfully updated." }

      else
        format.html { render :edit, status: :unprocessable_entity }

      end
    end
  end

  # DELETE /user_decisions/1 or /user_decisions/1.json
  def destroy
    @user_decision.destroy

    respond_to do |format|
      format.html { redirect_to user_decisions_url, notice: "User decision was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def customer_attributes
    [user_decision_params[:gender], user_decision_params[:age], user_decision_params[:educational_level].to_s,
     user_decision_params[:martial_status].to_s, user_decision_params[:professional_area].to_s, user_decision_params[:family_size].to_s]
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user_decision
    @user_decision = UserDecision.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_decision_params
    params.require(:user_decision).permit(:gender, :age, :educational_level, :martial_status, :professional_area,
                                          :family_size)
  end
end
