# This file will be grow! A LOT!
# rubocop:disable Metrics/LineLength
# rubocop:disable Style/AsciiComments

if Rails.env.production?
  ApiKey.create! unless ApiKey.any?

  # Clubs:
  json_clubs = [
    { official_website: 'corinthians.com.br', remote_shield_url: 'https://wikioso.org/wp-content/uploads/2013/04/escudo-do-corinthians.png', official_facebook_page: 'facebook.com/corinthians', short_name: 'Corinthians', full_name: 'Sport Club Corinthians Paulista', initials: 'COR' },
    { official_website: 'palmeiras.com.br', remote_shield_url: 'http://vignette2.wikia.nocookie.net/futebol/images/f/f1/Escudo-do-palmeiras.png/revision/latest?cb=20140719202448', official_facebook_page: 'facebook.com/sePalmeiras', short_name: 'Palmeiras', full_name: 'Sociedade Esportiva Palmeiras', initials: 'PAL' },
    { official_website: 'santosfc.com.br', remote_shield_url: 'https://wikioso.org/wp-content/uploads/2013/04/escudo-do-santos.png', official_facebook_page: 'facebook.com/santosfc', short_name: 'Santos', full_name: 'Santos Futebol Clube', initials: 'SAN' },
    { official_website: 'saopaulofc.com.br', remote_shield_url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/SaoPauloFC.svg/2000px-SaoPauloFC.svg.png', official_facebook_page: 'facebook.com/saopaulofc', short_name: "São Paulo", full_name: "São Paulo Futebol Clube", initials: 'SAO' },
    { official_website: 'gremio.com.br', remote_shield_url: 'http://www.constantinaweb.com.br/wp-content/uploads/2015/06/Grêmio.png', official_facebook_page: 'facebook.com/MeuGremio', short_name: "Grêmio", full_name: "Grêmio Foot-Ball Porto Alegrense", initials: 'GRE' },
    { official_website: 'atletico.com.br', remote_shield_url: 'http://www.vidanovafm.com.br/home/images/stories/escudo-do-Atletico-Mineiro.png', official_facebook_page: 'facebook.com/clubeatleticomineiro', short_name: "Atlético-MG", full_name: "Clube Atlético Mineiro", initials: 'CAM' },
    { official_website: 'atleticoparanaense.com', remote_shield_url: 'https://wikioso.org/wp-content/uploads/2013/08/escudo-atletico-paranaense.png', official_facebook_page: 'facebook.com/atleticopr', short_name: "Atlético-PR", full_name: "Clube Atlético Paranaense", initials: 'CAP' },
    { official_website: 'cruzeiro.com.br', remote_shield_url: 'http://picpaste.com/pics/a10d8d8c59b9c57e0c7784166efb0d28.1456781616.png', official_facebook_page: 'facebook.com/cruzeirooficial', short_name: 'Cruzeiro', full_name: 'Cruzeiro Esporte Clube', initials: 'CRU' },
    { official_website: 'internacional.com.br', remote_shield_url: 'https://wikioso.org/wp-content/uploads/2013/04/escudo-do-internacional.png', official_facebook_page: 'facebook.com/SCInternacional.Oficial', short_name: 'Internacional', full_name: 'Sport Club Internacional', initials: 'INT' },
    { official_website: 'coritiba.com.br', remote_shield_url: 'http://picpaste.com/pics/1f78456034485ae89a8036d01844a0c3.1456778757.png', official_facebook_page: 'facebook.com/coritibaoficial', short_name: 'Coritiba', full_name: 'Coritiba Foot Ball Club', initials: 'CFC' },
    { official_website: 'sportrecife.com.br', remote_shield_url: 'https://upload.wikimedia.org/wikipedia/en/thumb/4/45/Sport_Club_Recife.svg/924px-Sport_Club_Recife.svg.png', official_facebook_page: 'facebook.com/sportclubdorecife', short_name: 'Sport', full_name: 'Sport Club do Recife', initials: 'SPO' },
    { official_website: 'pontepreta.com.br', remote_shield_url: 'https://wikioso.org/wp-content/uploads/2013/08/escudo-ponte-preta.png', official_facebook_page: 'facebook.com/PontePretaOficial', short_name: 'Ponte Preta', full_name: "Associação Atlética Ponte Preta", initials: 'PON' },
    { official_website: 'flamengo.com.br', remote_shield_url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Flamengo_braz_logo.svg/2000px-Flamengo_braz_logo.svg.png', official_facebook_page: 'facebook.com/FlamengoOficial', short_name: 'Flamengo', full_name: 'Clube de Regatas do Flamengo', initials: 'FLA' },
    { official_website: 'fluminense.com.br', remote_shield_url: 'https://wikioso.org/wp-content/uploads/2013/04/escudo-do-fluminense.png', official_facebook_page: 'facebook.com/FluminenseFC', short_name: 'Fluminense', full_name: 'Fluminense Football Club', initials: 'FLU' },
    { official_website: 'chapecoense.com', remote_shield_url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Símbolo_da_Chapecoense_sem_estrelas.svg/2000px-Símbolo_da_Chapecoense_sem_estrelas.svg.png', official_facebook_page: 'facebook.com/AChapeF', short_name: 'Chapecoense', full_name: "Associação Chapecoense de Futebol", initials: 'CHA' },
    { official_website: 'figueirense.com.br', remote_shield_url: 'http://www.cebolabrindes.com.br/css/images/figueirense.png', official_facebook_page: 'facebook.com/figueirensefc', short_name: 'Figueirense', full_name: 'Figueirense Futebol Clube', initials: 'FIG' },
    { official_website: 'botafogo.com.br', remote_shield_url: 'https://wikioso.org/wp-content/uploads/2013/04/escudo-do-botafogo.png', official_facebook_page: 'facebook.com/BotafogoOficial', short_name: 'Botafogo', full_name: 'Botafogo de Futebol e Regatas', initials: 'BOT' },
    { official_website: 'santacruzpe.com.br', remote_shield_url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/Santa_Cruz_FC_(01)_-_PE.svg/1109px-Santa_Cruz_FC_(01)_-_PE.svg.png', official_facebook_page: 'facebook.com/OficialSantaCruzFC', short_name: 'Santa Cruz', full_name: 'Santa Cruz Futebol Clube', initials: 'STA' },
    { official_website: 'ecvitoria.com.br', remote_shield_url: 'https://wikioso.org/wp-content/uploads/2013/08/escudo-do-vitoria-time.png', official_facebook_page: 'facebook.com/ecvitoriaoficial', short_name: "Vitória", full_name: "Esporte Clube Vitória", initials: 'VIT' },
    { official_website: 'americamineiro.com.br', remote_shield_url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/Escudo_do_America_Futebol_Clube.svg/2000px-Escudo_do_America_Futebol_Clube.svg.png', official_facebook_page: 'facebook.com/Americafcoficial', short_name: "América-MG", full_name: "América Futebol Clube", initials: 'AMG' },
    { official_website: 'goiasec.com.br', remote_shield_url: 'http://picpaste.com/pics/Goias.1456781981.png', official_facebook_page: 'facebook.com/goiasoficial', short_name: "Goiás", full_name: "Goiás Esporte Clube", initials: 'GOI' },
    { official_website: 'avai.com.br', remote_shield_url: 'http://picpaste.com/pics/UVAIY5Ji.1456806844.png', official_facebook_page: 'facebook.com/avaifc', short_name: "Avaí", full_name: "Avaí Futebol Clube", initials: 'AVA' },
    { official_website: 'esporteclubebahia.com.br', remote_shield_url: 'http://picpaste.com/pics/bJ5GsdNG.1456807419.png', official_facebook_page: 'facebook.com/ecbahia', short_name: 'Bahia', full_name: 'Esporte Clube Bahia', initials: 'BAH' },
    { official_website: 'londrinaesporteclube.com.br', remote_shield_url: 'http://www.cebolabrindes.com.br/css/images/LOGOLON.png', official_facebook_page: 'facebook.com/londrinaec', short_name: 'Londrina', full_name: 'Londrina Esporte Clube', initials: 'LON' },
    { official_website: 'vasco.com.br', remote_shield_url: 'https://upload.wikimedia.org/wikipedia/en/thumb/1/1a/ClubDeRegatasVascoDaGama.svg/809px-ClubDeRegatasVascoDaGama.svg.png', official_facebook_page: 'facebook.com/vascodagama', short_name: 'Vasco da Gama', full_name: 'Club de Regatas Vasco da Gama', initials: 'VAS' },
    { official_website: 'nautico-pe.com.br', remote_shield_url: 'http://picpaste.com/pics/1iM8yCax.1456809297.png', official_facebook_page: 'facebook.com/nauticope', short_name: "Náutico", full_name: "Clube Náutico Capibaribe", initials: 'NAU' },
    { official_website: 'jec.com.br', remote_shield_url: 'https://discursodeportugues.files.wordpress.com/2011/04/escudo-jec4.png', official_facebook_page: 'facebook.com/JECoficial', short_name: 'Joinville', full_name: 'Joinville Esporte Clube', initials: 'JEC' },
    { official_website: 'cearasc.com', remote_shield_url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Ceará_Sporting_Club_logo.svg/2000px-Ceará_Sporting_Club_logo.svg.png', official_facebook_page: 'facebook.com/CearaSC', short_name: "Ceará", full_name: "Ceará Sporting Club", initials: 'CEA' }
  ]

  json_clubs.each { |params| Club.create(params) unless Club.find_by_short_name(params[:short_name]) }

  # atlético mg / coxa / bambis
  json_sources = [
    # General
    { name: 'bola fora zoeira', key: '1472258476385462', root_url: 'facebook.com/bolaforazoeira', kind: SourceKind::FACEBOOK_PAGE, status: CommonStatus::ACTIVE },
    { name: 'O Pior Time Do Brasil', key: '1595557890727584', root_url: 'facebook.com/OPiorTimeDoBrasil', kind: SourceKind::FACEBOOK_PAGE, status: CommonStatus::ACTIVE },
    { name: 'Humor Esportivo (lance)', key: 'http://humoresportivo.lance.com.br/feed', root_url: 'humoresportivo.lance.com.br', kind: SourceKind::RSS_FEED, status: CommonStatus::ACTIVE },
    { name: 'Futirinhas', key: 'http://feeds.feedburner.com/FutirinhasFutebolClube?format=xml', root_url: 'http://futirinhas.com', kind: SourceKind::RSS_FEED, status: CommonStatus::ACTIVE },
    { name: 'br4sileir4o M1l Gr4u', key: '583337698395496', root_url: 'facebook.com/br4sileir4oM1lGr4u', kind: SourceKind::FACEBOOK_PAGE, status: CommonStatus::ACTIVE },
    { name: 'Zueira Interativa', key: '1607633746172974', root_url: 'facebook.com/Zueira-Interativa-1607633746172974', kind: SourceKind::FACEBOOK_PAGE, status: CommonStatus::ACTIVE },
    { name: 'Brazueirão', key: '484606234981170', root_url: 'facebook.com/Brazueir%C3%A3o-484606234981170/', kind: SourceKind::FACEBOOK_PAGE, status: CommonStatus::ACTIVE },
    { name: 'Fute Da Depressao', key: '150877315053016', root_url: 'facebook.com/FuteDaDepressao', kind: SourceKind::FACEBOOK_PAGE, status: CommonStatus::ACTIVE },
    { name: 'Zueira F.C.', key: '233052393543571', root_url: 'facebook.com/mito.zueirafc/', kind: SourceKind::FACEBOOK_PAGE, status: CommonStatus::ACTIVE },
    { name: 'Z031r4 M1L GR4U FC', key: '529506403829696', root_url: 'facebook.com/Z031r4-M1L-GR4U-FC-529506403829696', kind: SourceKind::FACEBOOK_PAGE, status: CommonStatus::ACTIVE },
    { name: 'Fanáticos Por Futebol', key: '395733423787890', root_url: 'facebook.com/Fanaticosporfutebool/', kind: SourceKind::FACEBOOK_PAGE, status: CommonStatus::ACTIVE },
    { name: 'Gol Contra', key: '356783301073093', root_url: 'facebook.com/contragoloficial/', kind: SourceKind::FACEBOOK_PAGE, status: CommonStatus::ACTIVE },
    { name: 'Virô Piada', key: '161261117274382', root_url: 'facebook.com/pages/Vir%C3%B4-Piada/161261117274382', kind: SourceKind::FACEBOOK_PAGE, status: CommonStatus::ACTIVE },
    # { name: '', key: '', root_url: '', kind: SourceKind::FACEBOOK_PAGE, status: CommonStatus::ACTIVE },
    # { name: '', key: '', root_url: '', kind: SourceKind::FACEBOOK_PAGE, status: CommonStatus::ACTIVE },

    # Specific Clubs
    { name: 'Vaaai Corinthians', key: '1425809977730393', root_url: 'facebook.com/VaaaiCorinthians', kind: SourceKind::FACEBOOK_PAGE, status: CommonStatus::ACTIVE, troller: Club.find_by_initials('COR') },
    { name: '5ant0s m1l Gr4u', key: '446543278773121', root_url: 'facebook.com/5ant0sm1lGr4u/', kind: SourceKind::FACEBOOK_PAGE, status: CommonStatus::ACTIVE, troller: Club.find_by_initials('SAN') },
    { name: 'palmeiras mil grau', key: '409497435809437', root_url: 'facebook.com/palmeirasmilgrau/', kind: SourceKind::FACEBOOK_PAGE, status: CommonStatus::ACTIVE, troller: Club.find_by_initials('PAL') },
    { name: 'J3sus M1L Gr4u', key: '1524523077800485', root_url: 'facebook.com/J3sus-M1L-Gr4u-1524523077800485/', kind: SourceKind::FACEBOOK_PAGE, status: CommonStatus::ACTIVE, troller: Club.find_by_initials('PAL') },
    { name: 'cruzeiro do humor key', key: '845983888820014', root_url: 'facebook.com/cruzeirodohumoroficial/', kind: SourceKind::FACEBOOK_PAGE, status: CommonStatus::ACTIVE, troller: Club.find_by_initials('CRU') },
    { name: 'Cruzeiro da Zoeira Oficial', key: '700764236624458', root_url: 'facebook.com/CruzeirodaZoeiraOficial/', kind: SourceKind::FACEBOOK_PAGE, status: CommonStatus::ACTIVE, troller: Club.find_by_initials('CRU') },
    { name: 'Cap M1L GR4U', key: '538026016313060', root_url: 'facebook.com/CapM1LGR4U', kind: SourceKind::FACEBOOK_PAGE, status: CommonStatus::ACTIVE, troller: Club.find_by_initials('CAP') },
    { name: 'Colorado De Nascimento', key: '136892513112124', root_url: 'facebook.com/ColoradoDeNascimento/', kind: SourceKind::FACEBOOK_PAGE, status: CommonStatus::INACTIVE, troller: Club.find_by_initials('INT') },
    { name: 'Inferno Meu Destino', key: '280101252001087', root_url: 'facebook.com/infernomeudestino/', kind: SourceKind::FACEBOOK_PAGE, status: CommonStatus::ACTIVE, troller: Club.find_by_initials('INT') },
    { name: 'COMO É BOM SER COLORADO', key: '212883242147141', root_url: 'facebook.com/COMO.E.BOM.SER.COLORADO/', kind: SourceKind::FACEBOOK_PAGE, status: CommonStatus::ACTIVE, troller: Club.find_by_initials('INT') },
    { name: 'SÃO PAULO Da Zueira', key: '248362678625801', root_url: 'facebook.com/SÃO-PAULO-Da-Zueira-248362678625801/', kind: SourceKind::FACEBOOK_PAGE, status: CommonStatus::ACTIVE, troller: Club.find_by_initials('SAO') },
    { name: '5pfcM1lGr4u', key: '469310359770958', root_url: 'facebook.com/5pfcM1lGr4u/', kind: SourceKind::FACEBOOK_PAGE, status: CommonStatus::ACTIVE, troller: Club.find_by_initials('SAO') },
    { name: 'Tr1color da D3pr355ão', key: '551182858357185', root_url: 'facebook.com/Tr1color-da-D3pr355%C3%A3o-551182858357185/', kind: SourceKind::FACEBOOK_PAGE, status: CommonStatus::ACTIVE, troller: Club.find_by_initials('GRE') },
    { name: 'Gremio Da Zueira', key: '725993227436511', root_url: 'facebook.com/GremioDaZueira/', kind: SourceKind::FACEBOOK_PAGE, status: CommonStatus::ACTIVE, troller: Club.find_by_initials('GRE') },
    { name: 'GremioMilGrau', key: '728847817204368', root_url: 'facebook.com/GremioMilGrau/', kind: SourceKind::FACEBOOK_PAGE, status: CommonStatus::ACTIVE, troller: Club.find_by_initials('GRE') },
    { name: 'SempreGremioSG', key: '496873630414435', root_url: 'facebook.com/SempreGremioSG/', kind: SourceKind::FACEBOOK_PAGE, status: CommonStatus::ACTIVE, troller: Club.find_by_initials('GRE') },
    { name: 'P3p Gu4rd1r0g3r', key: '644677392220311', root_url: 'facebook.com/p3p.gr/', kind: SourceKind::FACEBOOK_PAGE, status: CommonStatus::ACTIVE, troller: Club.find_by_initials('GRE') },
    { name: 'Furacão da Zuação', key: '1497239083883383', root_url: 'facebook.com/FDZ023', kind: SourceKind::FACEBOOK_PAGE, status: CommonStatus::ACTIVE, troller: Club.find_by_initials('CAP') },
    { name: 'Atlético PR eu te sigo em toda parte', key: '1408546999358339', root_url: 'facebook.com/atleticotof/', kind: SourceKind::FACEBOOK_PAGE, status: CommonStatus::ACTIVE, troller: Club.find_by_initials('CAP') }
    # { name: '', key: '', root_url: '', kind: SourceKind::FACEBOOK_PAGE, status: CommonStatus::ACTIVE, troller: Club.find_by_initials('') }
    # { name: '', key: '', root_url: '', kind: SourceKind::FACEBOOK_PAGE, status: CommonStatus::ACTIVE, troller: Club.find_by_initials('') }
  ]

  json_sources.each { |params| Source.create(params) unless Source.find_by_key(params[:key]) }

  json_nicknames = [
    { name: 'corintiano', ini: 'COR' }, { name: 'fiel', plural: 'fiéis', ini: 'COR' },
    { name: 'palmeirense', ini: 'PAL' }, { name: 'palestrino', ini: 'PAL' },
    { name: 'santista', ini: 'SAN' }, { name: 'alvinegro santista', ini: 'SAN' },
    { name: 'são paulino', ini: 'SAO' },
    { name: 'gremista', ini: 'GRE' },
    { name: 'atleticano', plural: 'atleticanos', ini: 'CAM' },
    { name: 'atleticano', plural: 'atleticanos', ini: 'CAP' },
    { name: 'cruzeirense', ini: 'CRU' },
    { name: 'colorado', ini: 'INT' },
    { name: 'coxa-branca', ini: 'CFC' },
    { name: 'sportista', ini: 'SPO' }, { name: 'leonino', ini: 'SPO' }, { name: 'rubro-negro', ini: 'SPO' },
    { name: 'pontepretano', ini: 'PON' },
    { name: 'flamenguista', ini: 'FLA' }, { name: 'rubro-negro', ini: 'FLA' },
    { name: 'tricolor', ini: 'FLU' }, { name: 'pó de arroz', plural: 'pó de arrozes', ini: 'FLU' }, { name: 'tricolor das laranjeiras', plural: 'tricolor das laranjeiras', ini: 'FLU' },
    { name: 'chapecoense', ini: 'CHA' },
    { name: 'alvinegro', ini: 'FIG' }, { name: 'figueira', ini: 'FIG' },
    { name: 'botafoguense', ini: 'BOT' }, { name: 'alvinegro', ini: 'BOT' },
    { name: 'tricolor', ini: 'STA' }, { name: 'coral', plural: 'corais', ini: 'STA' },
    { name: 'rubro-negro baiano', ini: 'VIT' }, { name: 'rubro-negros baianos', ini: 'VIT' },
    { name: 'americanos', ini: 'AMG' },
    { name: 'esmeraldino', ini: 'GOI' }, { name: 'alviverde', ini: 'GOI' },
    { name: 'avaiano', ini: 'AVA' }, { name: 'azzura', ini: 'AVA' },
    { name: 'tricolor baiano', ini: 'BAH' },
    { name: 'tubarão', ini: 'LON' }, { name: 'tubarões', ini: 'LON' },
    { name: 'vascaíno', ini: 'VAS' }, { name: 'cruzmaltino', ini: 'VAS' },
    { name: 'alvirrubro', ini: 'NAU' },
    { name: 'jequeano', ini: 'JEC' }, { name: 'tricolor catarinense', ini: 'JEC' },
    { name: 'alvinegro cearense', plural: 'alvinegros cearenses', ini: 'CEA' }
  ]

  json_nicknames.each do |params|
    params.merge!(status: CommonStatus::ACTIVE, club: Club.find_by_initials(params[:ini])).except!(:ini)

    NicknameFan.create(params) unless NicknameFan.find_by_name_and_club_id(params[:name], params[:club]) || params[:club].nil?
  end
end
