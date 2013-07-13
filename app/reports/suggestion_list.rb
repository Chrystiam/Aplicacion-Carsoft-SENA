class SuggestionList < Prawn::Document
  #Hay dos formas de hacerlo 1- con el constructor de la clase o  2- con este Método principal que construye el  documento pdf y se invoca con el contructor en el controller
  
  # 1- Método constructor de la clase Orderlist 
  
  def initialize(suggestions, view)
     super()
     logo 
     @sugerencias = suggestions
     @vista = view
     suggestion_details
  end
   
  # 2- Método que reemplaza el constructor(initialize se elimina), pero implica que en el controller de la clase se invoque así:
  #  output = OrderList.new.to_pdf(@orders,view_context) -> es más larga esta forma.
  # y también se debe cambiar el formato quitandole el método render así:
  # format.pdf{
  #      send_data output, :filename => "orderslist.pdf", :type => "application/pdf", :disposition => "inline"
  #    }
  def to_pdf(suggestions, view)
    logo
    @sugerencias = suggestions
    @vista = view
    suggestion_details
    render
  end
  
  #Método para definir el logo con su ubicación así como el título del reporte  
  def logo
    logopath =  "#{Rails.root}/app/assets/images/sugerencias.png"
    image logopath, :width => 80, :height => 80
    move_down 10
    draw_text "Listado de Sugerencias", :at => [150, 575], size: 22
    text "Listado de Sugerencias"
  end
  
  #Método para dar formato a la salida de los registros
  def precision(num)
    @vista.number_with_precision(num, :locale => :es ,:precision => 2, :separator => ",", :delimiter => '.')
  end
  
  #Método para almacenar y mostrar los registros del detalle de la orden
  def suggestion_item_rows
    [["#", "Nombre", "Documento", "Identificacion", "Sugerencia", "Telefono"]] +
    @sugerencias.map do |sugerencia|
      [ "#{sugerencia.id}",
        "#{sugerencia.name}" , 
        "#{sugerencia.document.name}" , 
      "#{precision(sugerencia.number_identification)}",
      "#{precision(sugerencia.suggestion)}",
      "#{precision(sugerencia.phone)}"]
    end
  end
  
  #Método que imprime la tabla de las ordenes que hay

  def suggestion_details
    move_down 60
    table suggestion_item_rows, :width => 559.8839999999999 do
      row(0).font_style = :bold
      columns(1..3).align = :right
      self.header = true
      self.column_widths = {7 => 60, 10 => 100, 2 => 100, 40 => 100}
    end
  end


end