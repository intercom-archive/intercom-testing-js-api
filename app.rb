require 'sinatra'
require 'openssl'
require 'dotenv'
require 'json'
Dotenv.load

def read_apps
	@apps = {}
	i = 1
	while true
		app_id = ENV["APP#{i}"]
		name = ENV["APP#{i}_NAME"]
		secret = ENV["APP#{i}_SECRET"]

		if(!app_id.nil?)
			@apps[app_id.to_s] = {id: app_id, name: name || app_id, secret: secret}
			i = i + 1
		else
			break
		end
	end

	puts @apps.to_json
end

post '/user_hash' do
	read_apps
	puts params.inspect
	data = params["data"]
	app_id = params["app_id"]
	puts @apps.inspect
	secret = @apps[app_id][:secret]
	puts "app_id: #{app_id}"
	puts "data: #{data}"
	puts "secret: #{secret}"
	tmp = {user_hash: OpenSSL::HMAC.hexdigest('sha256', secret || "", data || "").upcase}
	tmp.to_json
end
get '/apps' do
	read_apps
	@apps.keys.map{|k|
		{id: @apps[k][:id], name: @apps[k][:name]}
	}.to_json
end

get '/' do
	read_apps
	erb :index
end
