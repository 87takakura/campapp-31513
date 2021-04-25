class CamppostsearchesController < ApplicationController
  before_action :search_camppostsearch, only: [:index, :search]

  def index
    @camppostsearches = Camppostsearch.all
    set_camppostsearch_column
  end

  def search
    @results = @p.result.includes(:category) 
  end

  private

  def search_camppostsearch
    @p = Camppostsearch.ransack(params[:q])  # 検索オブジェクトを生成
  end
  
  def set_camppostsearch_column
    @camppostsearch_name = Camppostsearch.select("name").distinct  # 重複なくnameカラムのデータを取り出す
  end
  

end
