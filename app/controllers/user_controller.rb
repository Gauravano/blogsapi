class UserController < ApiController
  
  def signin
  	phone_number  = params["phone_number"]
  	user = User.find_by_phone_number(phone_number)
  	unless user
  		user = User.create phone_number: phone_number
  	end

  	user.generate_otp
  	user.send_otp
  	data = {}
  	data["message"] = "Verify otp"
  	render json: data
  end

def verify_otp
	data = {}

	phone_number = params["phone_number"]
	user = User.find_by_phone_number(phone_number)
	if user
		if user.verify_otp params["otp"].to_i
 			data["access_token"] = user.access_token
 			return response_data data,"You are logged in ",200
		else
			return response_data nil,"Wrong otp ",200
		end

end


  def signout
  end
end
