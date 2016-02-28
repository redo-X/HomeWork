class SearchController < ApplicationController

  def searchForProductionOrders

    @production_orders = ProductionOrder.joins(:article)
                             .where(['CAST(number AS text) = ? or CAST(articles.code AS text) = ?', params[:search].to_s, params[:search].to_s])
                             .select('production_orders.id,
                                      production_orders.number,
                                      production_orders.due_date,
                                      articles.code as art_code,
                                      articles.name as art_name')
                             .limit(50)

  end

  def searchForArticles

    @articles = Article.where('CAST(code AS text) LIKE :prefix or name LIKE :prefix', prefix: "#{params[:search].to_s}%")
                       .select('id, code, name, version')
                       .limit(50)
  end

  def searchForWorkPlans

    @work_plans = WorkPlan.where('name LIKE :prefix or description LIKE :prefix', prefix: "#{params[:search].to_s}%")
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
