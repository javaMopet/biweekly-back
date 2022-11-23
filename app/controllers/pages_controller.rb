class PagesController < ApplicationController
  def home
    # Prawn::Document.generate("hello_world.pdf") do 
    #   text "Hello World!"
    #   stroke_circle [250,300], 200
    # end 
    send_data Pdf::PdfSingleBlog.new.print_data, file_name: 'blog.pdf', type: 'application/pdf'#, disposition: :attachment
  end

  # class PdfSingleBlog 
  #   def print_data 
  #     pdf = Prawn::Document.new 
  #     pdf.text "Hola mundo"
  #     pdf.text "Esto es un prueba de fuego"
  #     pdf.render
  #   end   
  # end 
  
end
