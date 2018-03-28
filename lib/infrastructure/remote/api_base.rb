module Infrastructure
  module Remote
    module ApiBase
      private
      attr_reader :request_api

      public
      def initialize(request_api:)
        @request_api = request_api
      end
    end
  end
end
