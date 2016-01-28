module Actions
  class MicropostService
    attr_reader :micropost

    def initialize(micropost)
      @micropost = micropost
    end

    def ban!
      micropost.banned!
      micropost.save
    end

    def activate!
      micropost.active!
      micropost.save
    end

    def delete!
      micropost.deleted!
      micropost.save
    end
  end
end
