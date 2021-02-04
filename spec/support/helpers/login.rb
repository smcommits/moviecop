def sign_in_as(user)
  post '/login', params: {username: user.username}
end
