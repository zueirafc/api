class ContactStatus < EnumerateIt::Base
  associate_values unread: 1, read: 2
end
