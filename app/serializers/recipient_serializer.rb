class RecipientSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :location, :gender, :personal_notes
end
