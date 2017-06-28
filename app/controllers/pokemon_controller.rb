class PokemonController < ApplicationController

  def show
  res = Typhoeus.get("http://pokeapi.co/api/v2/pokemon/"+params[:id], followlocation: true)
  body = JSON.parse(res.body)

  render json: {
    "name":body["name"],
    "id":body["id"],
    "type":body["types"].map do |type_hash|
      type_hash["type"]["name"]

        end
    }
  end
end
