module ActionController #:nodoc:
  module TypeResponse

    module ResponseTypes
      def user_action(&block)
        condition = { 
          user_action: -> (params) { 
            params[:user].room_id == params[:room].id || params[:room].owner_id == params[:user].id && params[:as_user] 
          }
        }

        register_condition(condition)

        custom(:user_action, &block)
      end

      def owner_action(&block)
        condition = { owner_action: -> (params) { params[:room].owner_id == params[:user].id && !params[:as_user] } }

        register_condition(condition)

        custom(:owner_action, &block)
      end
    end

    def choise_response(params)
      collector = Collector.new
      yield collector if block_given?
      if format = collector.negotiate_format(params)
        response = collector.response
        response.call if response
      else
        raise ActionController::UnknownFormat
      end
    end

    class Collector
      include ResponseTypes

      attr_accessor :format

      def initialize
        @responses = {}
        @conditions = []
      end

      def custom(response_type, &block)
        @responses[response_type] ||= if block_given?
          block
        end
      end

      def response
        response = @responses.fetch(format, [])
        response
      end

      #Choise between response_types
      def negotiate_format(params)
        @conditions.each do |condition|
          @format = condition.keys.first if condition.values.first.call(params)
        end

        @format
      end
      
      def register_condition(condition)
        @conditions << condition
      end
    end
  end
end
