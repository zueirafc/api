class MicropostStatus < EnumerateIt::Base
  # deleted: Quando eu vejo uma zueira que nao eh uma zueira na realidade
  # banned: Quando deu treta e alguem quer meu coro porque usei uma imagem prop.
  # active: As zueiras que serao exibidas lah
  # reproved: Zueiras que por algum motivo nao especificado sao reprovadas.
  # pending: Zueiras recentes que acabam de passar pelo crawler.
  associate_values deleted: 0, banned: 1, active: 2, reproved: 3, pending: 4
end
