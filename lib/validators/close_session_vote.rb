require 'active_model'

module Validators
  class CloseSessionVote
    include ActiveModel::Validations
    validate :can_close_session_vote
    
    def initialize attrs = {}
      @users = attrs[:users]
      @tasks = attrs[:tasks]
      @votes = attrs[:votes] 
    end

    private
    attr_accessor :users, :tasks, :votes
    def can_close_session_vote
      self.errors.add(session_vote: "Can't close session") if verify_attrs
    end

    def verify_attrs
      (@users.nil?) && (@tasks.nil?) && (@votes.nil?)
    end
  end
end
