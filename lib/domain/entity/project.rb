module Domain
  module Entity
    class Project
      include ::Domain::Entity::Base

      attr_reader :id, :name, :description

    end
  end
end

