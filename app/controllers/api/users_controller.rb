class Api::UsersController < ApplicationController
  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      # password_digest: params[:password_digest]
      # YOU WILL PROBABLY NEED TO CHANGE SOMETHING IN THIS FILE WHEN YOU FIGURE OUT AUTHENTICATION. I don't know why the two lines below from step 7 in the authenication cheat sheet are not working. I think it's confused bc there's no column name for password or password_confirmation, which is the name of the params. But making "password_digest" parameter also is not correct, bc the user is supposed to enter their actual pw, not the pw_digest. Right now something with encyrption is clearly broken. I can fix this later. Right now the post users action is actually creating the "password_digest" in Insomnia. I did skip step 4 so maybe that's why. 
      # ^^ I FIXED THIS. It worked when I did step 4. I think it was because I needed the has_secure_password method in the user model.
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end
end
