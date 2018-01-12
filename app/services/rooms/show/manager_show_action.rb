module Services
  module Rooms
    module Show
      class ManagerShowAction
        include Services::ResponseBase

        def choise_response params, &block
          super params, ResponseTypes, &block
        end
      end
    end
  end
end
