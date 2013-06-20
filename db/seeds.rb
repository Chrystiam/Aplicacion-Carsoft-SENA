# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Area.create(name: 'Zona A', description: 'zona perteneciente al centro de formacion en diseño, confeccion y moda')
Area.create(name: 'Zona B', description: 'zona perteneciente al centro de formacion en diseño, confeccion y moda')
Area.create(name: 'Zona C', description: 'zona perteneciente al centro tecnologico del inmobiliario') 
Area.create(name: 'Zona D', description: 'zona perteneciente al centro tecnologico del inmobiliario')
Area.create(name: 'Zona E', description: 'zona perteneciente al centro de diseño y manufactura del cuero')
Area.create(name: 'Zona F', description: 'zona perteneciente al centro de diseño y manufactura del cuero')

Center.create(name: 'Centro de formacion en diseño, confeccion y moda', code: '32423')
Center.create(name: 'Centro tecnologico del inmobiliario', code: '12315')
Center.create(name: 'Centro de diseño y manufactura del cuero', code: '41235')

Document.create(name: "Cedula de Ciudadania", initials: "Cc")
Document.create(name: "Tarjeta de Identidad", initials: "Ti")
Document.create(name: "Cedula de Extranjeria", initials: "Ce")
Document.create(name: "Pasaporte", initials: "Psp")
Document.create(name: "Documento nacional de identificacion", initials: "Dni")

Rh.create(name: "A+")
Rh.create(name: "A-")
Rh.create(name: "B+")
Rh.create(name: "B-")
Rh.create(name: "O+")
Rh.create(name: "O-")
Rh.create(name: "AB+")
Rh.create(name: "AB-")

Role.create(name: "Funcionarios", acronym: "FCN")
Role.create(name: "Contratistas", acronym: "CNT")
Role.create(name: "Aprendices", acronym: "APD")
Role.create(name: "Visitantes", acronym: "VST")


TypeMaterial.create(name: 'cajas', description: 'Cajas que puedenser utilizadas en la zona de bodega')
TypeMaterial.create(name: 'escobas', description: 'Suplemento de escobas para el personal de limpieza')
TypeMaterial.create(name: 'sillas', description: 'Sillas para los difenrentes espacios de aprendizaje de la institucion')
TypeMaterial.create(name: 'mesas', description: 'Mesas para una mayor comodidad dentro del complejo')


TypeUser.create(name: "Administrador", acronym: "ADM", description: "Acceso total a la aplicacion Crear,Mostrar,Actualizar,Eliminar")
TypeUser.create(name: "Guarda", acronym: "GRD", description: "Acceso de escritura Crear,Mostrar")
TypeUser.create(name: "Usuario", acronym: "USR", description: "Acceso con menos privilejios")

TypeVehicle.create(name: 'Abastecimiento', description: 'Ingresa para alimentar de materia prima el complejo')
TypeVehicle.create(name: 'Particular', description: 'Vehiculo de transporte publico de ingreso y egreso de forma inmediata')
