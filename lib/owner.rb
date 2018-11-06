require "pry"

class Owner
  @@owners = []
  attr_accessor :pets, :name
  attr_reader :species

  def initialize(species)
    @@owners << self
    @pets = {fishes: [], cats: [], dogs: []}
    @species = species
    @name = nil

  end

  def self.all
    @@owners
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    self.all.clear
  end

  def say_species
    "I am a #{species}."
  end

  def buy_cat(name)
    cat_name = Cat.new(name)
    pets[:cats] << cat_name

  end

  def buy_dog(name)
    dog_name = Dog.new(name)
    pets[:dogs] << dog_name
  end

  def buy_fish(name)
    fish_name = Fish.new(name)
    pets[:fishes] << fish_name
  end

  def walk_dogs
    self.pets[:dogs][0].mood = "happy"
  end

  def play_with_cats
    self.pets[:cats][0].mood = "happy"
  end

  def feed_fish
    self.pets[:fishes][0].mood = "happy"
  end

  def sell_pets
    self.pets.each do |species, names|
      names.each do |name|
        name.mood = "nervous"
      end
      names.clear
    end
  end

  def list_pets

    "I have #{self.pets[:fishes].length} fish, #{self.pets[:dogs].length} dog(s), and #{self.pets[:cats].length} cat(s)."
  end

end
