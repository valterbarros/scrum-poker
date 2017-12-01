require 'active_model'

module Validators
  class AddUserSessionVote
    include ActiveModel::Validations

    validate :session_closed

    def initialize attrs = {}
      @status = session_vote_finish
      @users = attrs[:users]
    end

    private
    attr_accessor :status, :users, :session_vote

    def session_closed
      self.errors.add(:session_vote, "Can't add user on session closed") if @status == ::SessionVote.statuses[:finish]
    end

    def session_vote_finish
      ::SessionVote.statuses[:finish]
    end

    def has_users
      @users != nil
    end
  end
end
