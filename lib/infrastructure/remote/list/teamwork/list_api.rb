module Infrastructure
  module Remote
    module List
      module Teamwork
        class ListApi
          include ::Infrastructure::Remote::ApiBase

          def all_by(project_id:)
            action    = "#{request_api.url_base}/projects/#{project_id}/tasklists.json"
            response  = basic_auth.get(action)
            json_body = JSON.parse(response.body)

            tasklists = json_body.fetch('tasklists', [])

            tasklists.map do |item|
              dto = Dto::ListResponse.new(item)
              ::Domain::Entity::List.new(dto.entity_attributes)
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

