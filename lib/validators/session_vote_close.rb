require 'active_model'

module Validators
  class SessionVoteClose
    include ActiveModel::Validations

    validate :session_vote_closed

    def initialize attrs = {}
      @users = attrs[:users]
      @closed = attrs[:closed]
    end

    private
   
    attr_reader :users, :closed, :session_vote

    def session_vote_closed
      self.errors.add(:session_vote, "Can't add user on session closed") if @closed && @users
    end
  end
end
