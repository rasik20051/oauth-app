class Authorization < ActiveRecord::Base
	belongs_to :user
	validates :provider,:uid,:user,presence: true

def self.find_or_create(auth_hash)
	unless auth = find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
	user=User.create name: auth_hash["user"]["name"],email: auth_hash["user"]["email"]
	auth = create user: user,provider: auth_hash["provider"],email: auth_hash["email"]
	end
	auth
end

end
