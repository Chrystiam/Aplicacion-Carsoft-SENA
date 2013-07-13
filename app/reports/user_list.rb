class UserList < Prawn::Document
  #Hay dos formas de hacerlo 1- con el constructor de la clase o  2- con este Método principal que construye el  documento pdf y se invoca con el contructor en el controller
  
  # 1- Método constructor de la clase Orderlist 
  
  def initialize(users, view)
     super()
     logo 
     @usuarios = users
     @vista = view
     user_details
  end
   
  # 2- Método que reemplaza el constructor(initialize se elimina), pero implica que en el controller de la clase se invoque así:
  #  output = OrderList.new.to_pdf(@orders,view_context) -> es más larga esta forma.
  # y también se debe cambiar el formato quitandole el método render así:
  # format.pdf{
  #      send_data output, :filename => "orderslist.pdf", :type => "application/pdf", :disposition => "inline"
  #    }
  def to_pdf(users, view)
    logo
    @usuarios = users
    @vista = view
    user_details
    render
  end
  
  #Método para definir el logo con su ubicación así como el título del reporte  
  def logo
    logopath =  "#{Rails.root}/app/assets/images/users.png"
    image logopath, :width => 80, :height => 80
    move_down 10
    draw_text "Listado de usuarios", :at => [150, 575], size: 22
    text "Listado de Usuarios"
  end
  
  #Método para dar formato a la salida de los registros
  def precision(num)
    @vista.number_with_precision(num, :locale => :es ,:precision => 2, :separator => ",", :delimiter => '.')
  end
  
  
  #Método para almacenar y mostrar los registros del detalle de la orden
  def user_item_rows
    [["#", "Nombre", "Identificacion", "Direccion", "Telefono", "Email"]] +
    @usuarios.map do |usuario|
      [ "#{usuario.id}",
        "#{usuario.name}",
        "#{usuario.identification}",
        "#{usuario.address_residence}",
        "#{usuario.phone}",
        "#{usuario.email}"]
    end
  end
  
  #Método que imprime la tabla de las ordenes que hay

  def user_details
    move_down 80
    table user_item_rows, :width =>  559.8839999999999 do
      row(0).font_style = :bold
      columns(1..3).align = :right
      self.header = true
      self.column_widths = {8 => 7, 6 => 500, 12 => 500, 8 => 500}
    end
  end

end
