# frozen_string_literal: true

module DecisionTree
  class ModelTraining < ApplicationService
    def initialize(attributes, training)
      super()
      @decision_tree = DecisionTree::ID3Tree.new(attributes, training, product, :discrete)
    end

    def call
      @decision_tree.train
    end
  end
end
