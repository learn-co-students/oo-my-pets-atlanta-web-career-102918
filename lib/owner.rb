class Owner 
  attr_reader :species
  attr_accessor :name, :pets

  @@all = []

  def initialize(species)
    @species = species
    @pets = {:fishes => [], :dogs => [], :cats => []}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count 
  end

  def self.reset_all
    self.all.clear
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(fish_name)
    new_fish = Fish.new(fish_name)
    @pets[:fishes] << new_fish
  end

  def buy_cat(cat_name)
    new_cat = Cat.new(cat_name)
    @pets[:cats] << new_cat
  end

  def buy_dog(dog_name)
    new_dog = Dog.new(dog_name)
    @pets[:dogs] << new_dog
  end

  def walk_dogs
    @pets[:dogs].each {|d| d.mood = "happy"}
  end

  def play_with_cats
    @pets[:cats].each {|c| c.mood = "happy"}
  end

  def feed_fish
    @pets[:fishes].each {|f| f.mood = "happy"}
  end

  def sell_pets
    @pets.each do |kind, pets|
      pets.each {|pet| pet.mood = "nervous"}
    end
    @pets.each do |kind, pets|
      pets.clear 
    end
  end

  def list_pets
    count_hash = {:fishes => 0, :dogs => 0, :cats => 0}
    @pets.each do |kind, pets|
      count_hash[kind] += pets.count
    end
    "I have #{count_hash[:fishes]} fish, #{count_hash[:dogs]} dog(s), and #{count_hash[:cats]} cat(s)."
  end
end