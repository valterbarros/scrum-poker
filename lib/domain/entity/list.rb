module Domain
  module Entity
    class List
      include ::Domain::Entity::Base

      attr_reader :id, :name, :description

    end
  end
end


