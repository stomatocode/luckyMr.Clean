
get '/' do
  @roll = Roll.new
  erb :index
end


# TODO: convert this route to use AJAX
post '/rolls' do
  content_type :json
  # If the user passes-in a "value", let's use it. Otherwise, we'll generate a random one.
  # See: roll_if_value_is_nil method in the Roll model.
  value = params[:value] ? params[:value].to_i : nil

  @roll = value ? Roll.create({ value: value }) : Roll.create

  { roll: @roll.value }.to_json
end
