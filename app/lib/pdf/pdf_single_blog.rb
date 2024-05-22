module Pdf
  class PdfSingleBlog 

    # Prueba generacion de pdf con Prawn
    def print_data 
      pdf = Prawn::Document.new 
      pdf.text "Hola mundo"
      pdf.text "Esto es un prueba de fuego"
      pdf.render
    end 
      
  end 
end
