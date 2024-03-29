# frozen_string_literal: true

module DecisionTree
  class ModelTraining < ApplicationService
    def initialize(customer_attributes)
      super()
      @training = TrainingDataset.call
      @attributes = ["Gender", "Age", "Educational Level", "Marital Status", "Professional Area", "Family Size"]
      @customer_attributes = customer_attributes
    end

    def call
      model = DecisionTree::ID3Tree.new(@attributes, @training, 1, :discrete)
      model.train
      prediction = model.predict(@customer_attributes)
      prediction
    end
  end
end
