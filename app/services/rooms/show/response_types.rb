module Services
  module Rooms
    module Show
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
    end
  end
end
