module Infrastructure
  module Remote
    module List
      module Teamwork
        module Dto
          class ListResponse
            include ::Domain::Entity::Base

            attr_reader :id, :name, :description

            def entity_attributes
              {
                id:          id,
                name:       name,
                description: description
              }
            end

          end
        end
      end
    end
  end
end


