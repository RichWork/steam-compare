# lib/middlewares/omniauth.rb

class Omniauth
  def initialize(app)
    @myapp = myapp
  end

  def call(env)
    if Rack::Request.new(env).params['my_token'] == 'MY_SECRET_TOKEN'
      @myapp.call(env)
    else
      Rack::Response.new([], 401, {}).finish
    end
  end
end
