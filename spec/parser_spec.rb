require_relative '../lib/parser'

describe Parser do

  def load_asset( path )
    IO.read( File.join( File.dirname(__FILE__), '..', 'assets', path ) )
  end

  it 'deve carregar as pessoas corretamente' do
    content = load_asset('principal.html')
    pessoas = Parser.instance.buscar_pessoas(content)
    pessoas.size.should == 15
    pessoas.first.should == {:id=>"1643847", :nome=>"AALINE SEVERIANO DA SILVA", :cpf=>"***.592.871-**", :lotacao=>"FUNDACAO UNIVERSIDADE DE BRASILIA", :exercicio=>"FUNDACAO UNIVERSIDADE DE BRASILIA", :jornada=>"40 HORAS SEMANAIS"}
    pessoas.last.should ==  {:id=>"1181741", :nome=>"ABADIA CANDIDA LEMES", :cpf=>"***.834.461-**", :lotacao=>"MINISTERIO DA SAUDE", :exercicio=>"ESTADOS / MUNICIPIOS / EMPRESAS", :jornada=>"40 HORAS SEMANAIS"}
  end

end