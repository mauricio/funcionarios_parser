require 'nokogiri'
require 'singleton'

class Parser

  include Singleton

  def buscar_pessoas( conteudo )
    document = Nokogiri::HTML( conteudo )
    pessoas = []
    document.css("tr").each do |linha|
      contents = linha.children.find_all { |data| is_content?(data) }
      if contents.size > 0
        id, nome = id_and_name( contents[1] )
        pessoa = {
            :id => id,
            :nome => nome,
            :cpf => content_for(0, contents),
            :lotacao => content_for(2, contents),
            :exercicio => content_for(3, contents),
            :jornada => content_for(4, contents)
        }
        pessoas << pessoa
      end
    end
    pessoas
  end

  def buscar_salario( conteudo )
    document = Nokogiri::HTML( conteudo )

  end

  def is_content?( data )
    data.name == 'td' &&
        !data.attributes['scope']
  end

  def content_for( index, value )
    value[index].children.first.to_s.strip
  end

  def id_and_name( root )
    link = root.children.first
    id = link.attributes['href'].value.split('=').last
    name = root.children.first.children.first.to_s.strip
    return id, name
  end

end