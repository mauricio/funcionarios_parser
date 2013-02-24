require 'nokogiri'
require 'httparty'

response = HTTParty.get("http://www.portaltransparencia.gov.br/servidores/Servidor-ListaServidores.asp?Ordem=2&paramDesc=1&Pagina=1")

puts response.body