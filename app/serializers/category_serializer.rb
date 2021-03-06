class CategorySerializer < ActiveModel::Serializer
  attributes :id, :toilet_paper, :diapers, :dental_hygiene, :first_aid, :general_hygiene, :underwear_socks, :blankets, :school_supplies
  has_many :recipients
  

  def serializable_hash(adapter_options = nil, options = {}, adapter_instance = self.class.serialization_adapter_instance)
  	hash = super
  	hash.each { |key, value| 
  		if value.nil?
  			hash[key] = ""
  		end
  	 }
  	hash
  end

end
