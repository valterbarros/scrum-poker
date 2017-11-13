module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = Struct.new(:name).new("Valter")
      logger.add_tags 'ActionCable', current_user.name
    end

    protected
      def find_verified_user
        puts "cookies: #{cookies.signed[:user_id]}"
        if verified_user = User.find_by(id: cookies.signed[:user_id])
          verified_user
        else
          #reject_unauthorized_connection
        end
      end
  end
end
