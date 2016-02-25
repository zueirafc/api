class MicropostStatus < EnumerateIt::Base
  # deleted: Quando eu vejo uma zueira que não é uma zueira na realidade
  # banned: Quando deu treta e alguém quer meu coro porque usei uma imagem prop.
  # active: As zueiras que serão exibidas lá
  # reproved: Zueiras que por algum motivo não especificado são reprovadas.
  # pending: Zueiras recentes que acabam de passar pelo crawler.
  associate_values deleted: 0, banned: 1, active: 2, reproved: 3, pending: 4
end
