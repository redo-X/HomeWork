module ProductionOrdersHelper

  def loadArticlesForSelection
    Article.all.collect {|a| [ a.code + " - " + a.name, a.id ] }

  end

end
