class PokemonController < ApplicationController

  def show
  res = Typhoeus.get("http://pokeapi.co/api/v2/pokemon/"+params[:id], followlocation: true)
  body = JSON.parse(res.body)

  render json: {
    results:[
    body["name"],body["types"][0]['type']['name'], body["id"]
    ]}

  end
end



  # body = JSON.parse(res.body)
  # body["pokemon"]
  #   puts poke["id"]
  #   puts poke["name"]
  #   puts poke ["type"]
