require 'active_model'

module Validators
  class CreateSessionVote
    include ActiveModel::Validations
    validates :tasks, presence: true

    def initialize attrs = {}
      @tasks = attrs[:tasks]
    end

    private
    attr_accessor :tasks
  end
end
