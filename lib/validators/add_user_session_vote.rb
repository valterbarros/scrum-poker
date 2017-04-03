require 'active_model'

module Validators
  class AddUserSessionVote
    include ActiveModel::Validations

    validate :session_closed

    def initialize attrs = {} 
      @closed = attrs[:closed]
      @users = attrs[:users]
    end

    private
    attr_accessor :closed, :users, :session_vote

    def session_closed
      self.errors.add(:session_vote, "Can't add user on session closed") if @closed && @users
    end
  end
end
