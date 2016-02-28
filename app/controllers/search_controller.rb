class SearchController < ApplicationController
  load_and_authorize_resource

  def searchForProductionOrders

    @production_orders = ProductionOrder.joins(:article)
                             .where(['number = ? or articles.code = ?', params[:search], params[:search]])
                             .select('production_orders.id,
                                      production_orders.number,
                                      production_orders.due_date,
                                      articles.code as art_code,
                                      articles.name as art_name')
                             .limit(50)

  end

  def searchForArticles

    @articles = Article.where('code LIKE :prefix or name LIKE :prefix', prefix: "#{params[:search]}%")
                       .select('id, code, name, version')
                       .limit(50)
  end

  def searchForWorkPlans

    @work_plans = WorkPlan.where('name LIKE :prefix or description LIKE :prefix', prefix: "#{params[:search]}%")
                          .select('id, name, description')
                          .limit(50)

  end


  def index

    @searchTerm = params[:search]

    searchForProductionOrders
    searchForArticles
    searchForWorkPlans
  end

  def availableSearchTerms
    { 'Artikel' => 1, 'Produktionsaufträge' => 2  }
  end

end
