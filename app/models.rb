DataMapper.setup :default, "sqlite3://#{Dir.pwd}/db.sqlite3"
module Model
  DM = ::DataMapper::Types
  class Teacher # Professeur
    include DataMapper::Resource
    property :id  , DM::Serial
    property :name, String
    has n, :courses
    has n, :mixed_groups
    has n, :times
  end 
  class MixedGroup # Classe mixe
    include DataMapper::Resource
    property :id    , DM::Serial
    property :level , Integer # 6,5,4,3,2,1,0(Terminale)…
    property :type  , String  # S,ES,L,BEP…
    property :number, Integer # 1,2,3…
    # TODO: useful ?
    #has n, :courses
    #has n, :unigroups
    #has n, :classrooms
    #has n, :times
    has n, :groups
  end 
  class Group # Groupe uni
    include DataMapper::Resource
    property :id, Serial
  end 
  class Course # Matière
    include DataMapper::Resource
    property :id, Serial
  end
  class ClassRoom # Salle
    include DataMapper::Resource
    property :id, Serial
  end
  # Has one of everything
  class Hour # Horaire
    include DataMapper::Resource
    property :id      , DM::Serial
    property :begins  , Float
    property :ends    , Float
    property :duration, Float
    before :save, :find_duration
    def find_duration
      @duration = @ends - @begins
    end
  end
end
