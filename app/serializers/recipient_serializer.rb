class RecipientSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :location, :gender, :personal_notes
  belongs_to :category
end
