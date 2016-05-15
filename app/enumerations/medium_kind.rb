class MediumKind < EnumerateIt::Base
  associate_values video: 1, photo: 2, link: 3

  def self.value_for(string)
    string.underscore.upcase!

    super(string)
  end
end
