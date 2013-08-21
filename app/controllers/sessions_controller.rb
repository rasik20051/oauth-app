class SessionsController < ApplicationController
  def new
  end

  def create
  	auto_hash = request.env['omniauth.auth']
  	# render text: auto_hash.inspect

  # 	@authorization = Authorization.find_by_provider_and_uid(auto_hash["provider"],auto_hash["uid"])
  # 	if @authorization

  # render text: "welcome back #{@authorization.user.name}"
  # else
  # 	user=User.new name: auto_hash["user"]["name"],email: auto_hash["user"]["email"]
  # 	user.authorization.build provider: auto_hash["provider"],uid: auto_hash["uid"]
  # 		user.save
  # 		render text: "HI #{user.name}.You successfully signed up"
  # 	end


  if session[:user_id]
  	
  	User.find(session[:user_id]).add_provider(auto_hash)

  	render text: "You can login using #{auto_hash[:provider]}.capitalize"
  else
    auth = Authorization.find_or_create(auth_hash)

  	session[:user_id]= auth.user.id
  	render text: "#{auth.user.name}"
  end


def destroy
	session[:user_id]=nil
	render text: "Logged out"
end

  end

  def failure
  	render text: "You dint allow access to this app"
  end

  
end
