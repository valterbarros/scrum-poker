module Infrastructure
  module Remote
    module Task
      module Teamwork
        class TaskApi
          include ::Infrastructure::Remote::ApiBase

          def all_by(project_id:)
            action    = "#{request_api.url_base}/tasklists/#{project_id}/tasks.json"
            response  = basic_auth.get(action)
            json_body = JSON.parse(response.body)

            todo_items = json_body.fetch('todo-items', [])

            todo_items.map do |item|
              dto = Dto::TaskResponse.new(item)
              ::Domain::Entity::Task.new(dto.entity_attributes)
            end

          end

          private
          def basic_auth
            HTTP.basic_auth(user: request_api.user, pass: '')
          end
        end
      end
    end
  end
end
