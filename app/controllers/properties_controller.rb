class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    @properties = Property.all
    @stations = Station.all

  end

  def new
    @property = Property.new
    2.times {@property.stations.build} #n個のフォームを生成
  end

  def show
  end

  def edit
    @property.stations.build
  end

  def update
    if @property.update(property_params)
      redirect_to properties_path, success: "編集しました！"
    else
      render :edit
    end
  end

  def create
    @property = Property.new(property_params)
    if params[:back]
      render :new
    else
      if @property.save
        redirect_to properties_path, success: "新規投稿しました！"
      else
        render :new
      end
    end
  end

  def destroy
    @property.destroy
    redirect_to properties_path, danger:"削除しました！"
  end

  private

  def property_params
    params.require(:property).permit(:name, :rent, :address, :age, :note, stations_attributes: [:id, :route, :name, :time_needed, :_destory])
  end
  def set_property
    @property = Property.find(params[:id])
  end


end
