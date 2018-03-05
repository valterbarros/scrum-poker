require 'http'
require_relative '../teamwork/dto/task_response.rb'

module Infrastructure
  module Remote
    module Task
      module Teamwork
        class TaskApi

          def initialize(request_api:)
            @request_api = request_api
          end

          def all_by(project_id:)
            action = "https://rogalabs.teamwork.com/tasklists/#{project_id}/tasks.json"
            r = JSON.parse(HTTP
              .headers(@request_api.headers)
              .get(action).body)['todo-items'][0]
              #.headers('Authorization': "Basic #{token}")

            Dto::TaskResponse.new(r)
          end

        end
      end

    end
  end
end

#api = Infrastructure::Remote::Task::Teamwork::TaskApi.new
#puts api.all_by(project_id: 551857).content
