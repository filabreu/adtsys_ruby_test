class ModelsController < ApplicationController
  def index
    Model.create(model_params)
  end

  protected

    def webmotors_params
      { marca: params[:webmotors_make_id] }
    end

    def model_params
      webmotors_search("http://www.webmotors.com.br/carro/modelos", webmotors_params).map do |hash|
        { name: hash["Nome"], webmotors_make_id: params[:webmotors_make_id] }
      end
    end
end
