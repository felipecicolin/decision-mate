# frozen_string_literal: true

class UserDecisionsController < ApplicationController
  def index
    @user_decisions = UserDecision.all
  end

  def new
    @user_decision = UserDecision.new
  end

  def create
    @user_decision = UserDecision.new(user_decision_params)
    @user_decision.decision = DecisionTree::ModelTraining.call(customer_attributes)

    if @user_decision.save
      redirect_to user_decisions_path,
                  notice: "This customer should probably buy products related to: #{@user_decision.decision}"
    else
      render :new
    end
  end

  private

  # formatting the params in an array of hashes to be used by the DecisionTree::ModelTraining service
  # this is the syntax expected by the DecisionTree::ModelTraining service to be able to be used
  def customer_attributes
    [
      user_decision_params[:gender], user_decision_params[:age], user_decision_params[:educational_level].to_s,
      user_decision_params[:martial_status].to_s, user_decision_params[:professional_area].to_s,
      user_decision_params[:family_size].to_s
    ]
  end

  def user_decision_params
    params.require(:user_decision).permit(:gender, :age, :educational_level, :martial_status, :professional_area,
                                          :family_size)
  end
end
