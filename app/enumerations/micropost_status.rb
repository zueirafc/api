class MicropostStatus < EnumerateIt::Base
  associate_values deleted: 0, banned: 1, active: 3, pending: 4
end
