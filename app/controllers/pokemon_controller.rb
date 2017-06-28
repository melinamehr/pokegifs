class PokemonController < ApplicationController

  def show
  res = Typhoeus.get("http://pokeapi.co/api/v2/pokemon/"+params[:id], followlocation: true)
  body = JSON.parse(res.body)

  #body["name"] # 'bulbasaur' name gotten from ^^^ first api call

  #second_response = Typhoeus.get("http://giphfy....?name=#{body['name']}")


  res_gif = Typhoeus.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV['GIPHY_KEY']}&q=#{body["name"]}", followlocation: true)
  body_gif = JSON.parse(res_gif.body)

  render json:
   {
    #  "url":body_gif["embed_url"].map do |type_gif|
    #    type_gif["body_gif"]["url"]
    url: body_gif["data"][0]["embed_url"],
    name: body["name"],
    id: body["id"],
    type: body["types"].map do |type_hash|
      type_hash["type"]["name"]
    end
    }
  end
end
