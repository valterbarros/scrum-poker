module Infrastructure
  module Remote
    module Task
      module Teamwork
        module Dto
          class TaskResponse
            include ::Domain::Entity::Base

            attr_reader :id, :content, :description

            def entity_attributes
              {
                id:          id,
                title:       content,
                description: description
              }
            end

          end
        end
      end
    end
  end
end
