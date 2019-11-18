class OthersController < ApplicationController
  
  def index
    @others = Others.all
    render json:@others
  end
  def show
    if params[:type].present?
      if params[:type] == 'calendario'
        @others = Others.all
        calendario = @others.find_by(type:params[:type])
        @animes = Anime.all
        lun = calendario['lunedi']
        mart = calendario['martedi']
        merc = calendario['mercoledi']
        gio = calendario['giovedi']
        ven = calendario['venerdi']
        sab = calendario['sabato']
        dom = calendario['domenica']
        calendario['lunedi'] = lun.map{|val| @animes.find_by(name:val)} 
        calendario['martedi'] = mart.map{|val| @animes.find_by(name:val)}
        calendario['mercoledi'] = merc.map{|val| @animes.find_by(name:val)}
        calendario['giovedi'] = gio.map{|val| @animes.find_by(name:val)}
        calendario['venerdi'] = ven.map{|val| @animes.find_by(name:val)}
        calendario['sabato'] = sab.map{|val| @animes.find_by(name:val)}
        calendario['domenica'] = dom.map{|val| @animes.find_by(name:val)}
        render json:calendario   
      elsif params[:type] == 'today'
        @oggi = Date.today
         
        @giorno = ''
        if @oggi.sunday?
          @giorno = 'domenica'
          
        elsif @oggi.monday?
          @giorno = 'lunedi'
        elsif @oggi.tuesday?
          @giorno = 'martedi'
        elsif @oggi.wednesday?
          @giorno = 'mercoledi'
        elsif @oggi.thursday?
          @giorno = 'giovedi'
        elsif @oggi.friday?
          @giorno = 'venerdi'
        elsif @oggi.saturday?
          @giorno = 'sabato'
        else
          @giorno = 'error'
        end
        if @giorno == 'error'
          render json:{error:'invalid Date.today'}
        else
          @others = Others.all
          calendario = @others.find_by(type:'calendario')
          @animes = Anime.all
          list = calendario[@giorno][0,3]
          v = list.map{|val| @animes.find_by(name:val)}
          render json:{giorno: v}
        end
      else
        render json:{error:'invalid param'}
      end
    else
      render json:{error:'not found param'}
    end
  end
end
