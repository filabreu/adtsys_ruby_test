class HomeController < ApplicationController
  def index
    @makes = Make.create(make_params)
  end

  protected

    def make_params
      webmotors_search("http://www.webmotors.com.br/carro/marcas", webmotors_params).map do |hash|
        { name: hash["Nome"], webmotors_id: hash["Id"] }
      end
    end
end
