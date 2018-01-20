
# Before you start read this code you need a disclaime I know this code increase the complexity from app
# But for this have a good motive I extract this from rails source to learn and implement new things from rails
# And is that

#This is a usage example on controller

# service.choise_response(response_params_show) do |format|
#   format.user_action { return render(action: :room_user) }
#   format.owner_action { return render(action: :room_owner_session) }
# end

module Services
  module ResponseBase
    def choise_response(params, response_type, &block)
      collector = Collector.new(response_type)

      block.call collector if block_given?

      if format = collector.negotiate_format(params)
        response = collector.response
        response.call if response
      end
    end

    class Collector
      attr_accessor :format

      def initialize(response_type)
        include_response_type response_type
        @responses = {}
        @conditions = []
      end

      def custom(response_type, &block)
        @responses[response_type] ||= block if block_given?
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

        @format ||= :default if @responses.has_key?(:default)
      end

      def register_condition(condition)
        @conditions << condition
      end

      def include_response_type response_type
        self.class.include response_type
      end
    end

  end
end
