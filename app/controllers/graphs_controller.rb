class GraphsController < ApplicationController
  def index
    gon.weight_records = Graph.chart_data(current_user)
    # gon.chart_label = ['1/1','1/2', '1/4', '1/5', '1/6', '1/7']
    # gon.chart_data = [60.3, 61.1, 60.8, nil, 60.5, 61.4]
    gon.recorded_dates = current_user.graphs.map(&:date)
  end 
  def  create
    @graphs = current_user.graphs.build(graph_params)
    data = @graph.date.strftime('%Y/%-m/%-d')
    if @graph.save
      flash[:notice] = "#{date}の記録を追加しました"
    else
      flash[:alert] = 'エラーが発生しました'
    end
    redirect_to root_path


  end

  def update


  end
  private 

  def graph_params
    params.require(:graph).permit(:date, :weight)
  end
end
