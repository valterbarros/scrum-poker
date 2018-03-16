module Infrastructure
  module Remote
    module Project
      module Teamwork
        class ProjectApi
          include ::Infrastructure::Remote::ApiBase

          def all
            action    = "#{request_api.url_base}/projects.json"
            response  = basic_auth.get(action)
            json_body = JSON.parse(response.body)

            projects = json_body.fetch('projects', [])

            projects.map do |item|
              dto = Dto::ProjectResponse.new(item)
              ::Domain::Entity::Project.new(dto.entity_attributes)
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
