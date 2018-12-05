require './lib/joke'
require './lib/user'
require "minitest/autorun"
require "minitest/pride"
require 'pry'

class UserTest < Minitest::Test

  def test_user_exists

    sal = User.new("Sal")

  assert_instance_of User, sal
  end

  def test_user_has_a_name

    sal = User.new("Sal")

  assert_equal "Sal", sal.name
  end

  def test_user_do_not_know_jokes_at_the_begginning

    sal = User.new("Sal")

  assert_equal [], sal.jokes
  end

  def test_user_can_learn_jokes

    sal = User.new("Sal")
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    sal.learn(joke_1)
    sal.learn(joke_2)

  assert_equal [joke_1, joke_2], sal.jokes
  end

  def test_user_can_tell_jokes_to_other_user

    sal = User.new("Sal")
    ali = User.new("Ali")
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    sal.tell(ali, joke_1)
    sal.tell(ali, joke_2)

  assert_equal [joke_1, joke_2], ali.jokes
  end

  def test_get_joke_by_id

    sal = User.new("Sal")
    ali = User.new("Ali")
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    sal.tell(ali, joke_1)
    sal.tell(ali, joke_2)

  assert_equal joke_1, ali.joke_by_id(1)
  assert_equal joke_2, ali.joke_by_id(2)
  end



end
