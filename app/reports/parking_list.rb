class ParkingList < Prawn::Document
  #Hay dos formas de hacerlo 1- con el constructor de la clase o  2- con este Método principal que construye el  documento pdf y se invoca con el contructor en el controller
  
  # 1- Método constructor de la clase Orderlist 
  
  def initialize(parkings, view)
     super()
     logo 
     @estacionamientos = parkings
     @vista = view
     parking_details
  end
   
  # 2- Método que reemplaza el constructor(initialize se elimina), pero implica que en el controller de la clase se invoque así:
  #  output = OrderList.new.to_pdf(@orders,view_context) -> es más larga esta forma.
  # y también se debe cambiar el formato quitandole el método render así:
  # format.pdf{
  #      send_data output, :filename => "orderslist.pdf", :type => "application/pdf", :disposition => "inline"
  #    }
  def to_pdf(parkings, view)
    logo
    @estacionamientos = parkings
    @vista = view
    parking_details
    render
  end
  
  #Método para definir el logo con su ubicación así como el título del reporte  
  def logo
    logopath =  "#{Rails.root}/app/assets/images/parking.png"
    image logopath, :width => 80, :height => 80
    move_down 10
    draw_text "Listado de Estacionamientos", :at => [150, 575], size: 22
    text "Listado de Estacionamientos"
  end
  
  #Método para dar formato a la salida de los registros
  def precision(num)
    @vista.number_with_precision(num, :locale => :es ,:precision => 2, :separator => ",", :delimiter => '.')
  end
  
  
  #Método para almacenar y mostrar los registros del detalle de la orden
  def parking_item_rows
    [["#","Descripcion", "Ubicación", "Espacio Disponible", "Area", "Vehiculo"]] +
    @estacionamientos.map do |estacionamiento|
      [ "#{estacionamiento.id}",
        "#{estacionamiento.description}",
        "#{estacionamiento.location}",
        "#{estacionamiento.space_avaible}",
        "#{estacionamiento.area.name}",
        "#{estacionamiento.vehicle.plate}"]
    end
  end
  
  #Método que imprime la tabla de las ordenes que hay

  def parking_details
    move_down 60
    table parking_item_rows, :width =>  519.996 do
      row(0).font_style = :bold
      columns(1..3).align = :right
      self.header = true
      self.column_widths = {10 => 200, 100 => 100, 200 => 100, 20 => 100}
    end 
  end

end