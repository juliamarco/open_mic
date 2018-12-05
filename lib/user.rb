require './lib/joke'


class User
  attr_reader :name,
              :jokes

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    @jokes << joke
  end

  def tell(user, joke)
    user.learn(joke)
  end

  def joke_by_id(id)
    @jokes.map do |joke|
      if joke.id == id
        return joke
      end
    end
  end

end

sal = User.new("Sal")
ali = User.new("Ali")
joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
sal.tell(ali, joke_1)
sal.tell(ali, joke_2)
ali.joke_by_id(1)
