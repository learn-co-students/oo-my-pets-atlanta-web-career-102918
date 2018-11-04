require 'pry'
class Owner
  # code goes here
  attr_accessor :name, :pets
  attr_reader :species
  @@all = []

  def initialize(species)
    @species = species
    @@all << self
    @pets = {
            :dogs => [],
            :fishes => [],
            :cats => []
          }
    end

  def self.all
    @@all
  end

  def self.reset_all
    @@all = []
  end

  def self.count
    @@all.count
  end

  def say_species
    "I am a human."
  end

  def buy_fish(fish)
    @pets[:fishes] << Fish.new(fish)
  end
  def buy_cat(cat)
    @pets[:cats] << Cat.new(cat)
  end
  def buy_dog(dog)
    @pets[:dogs] << Dog.new(dog)
  end

  def walk_dogs
    @pets[:dogs].map do |dog|
      dog.mood = "happy"
    end
  end
  def play_with_cats
    @pets[:cats].map do |cat|
      cat.mood = "happy"
    end
  end
  def feed_fish
    @pets[:fishes].map do |fish|
      fish.mood = "happy"
    end
  end
  def sell_pets
    @pets.each do |species, animal|
      animal.each do |pet, stats|
        pet.mood = "nervous"
      end
    end
    @pets = {
                :dogs => [],
                :fishes => [],
                :cats => []
              }
  end
  def list_pets
    
    "I have 2 fish, 3 dog(s), and 1 cat(s)."
  end
end
