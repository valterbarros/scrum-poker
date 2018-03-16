module Domain
  module Entity
    class Task
      include ::Domain::Entity::Base

      attr_reader :id, :title, :description

    end
  end
end
