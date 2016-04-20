defmodule PatternMatching do
  use Koans

  koan "One matches one" do
    assert match?(1, 1)
  end

  # These don't make much sense
  koan "A pattern can change" do
    a = 1
    assert a = 2
  end

  koan "A pattern can also be strict" do
    a = 1
    assert ^a = 1
  end

  koan "Patterns can be used to pull things apart" do
    [head | tail] = [1,2,3,4]

    assert head == 1
    assert tail == [2, 3, 4]
  end

  koan "And then put them back together" do
    head = 1
    tail = [2,3,4]

    assert [1, 2, 3, 4] == [head | tail]
  end

  koan "Some values can be ignored" do
    [_first, _second, third, _fourth] = [1,2,3,4]

    assert third == 3
  end

  koan "Strings come apart just a easily" do
    "Shopping list: " <> items = "Shopping list: eggs, milk"

    assert items == "eggs, milk"
  end

  koan "Patterns show what you really care about" do
    %{make: make} = %{type: "car", year: 2016, make: "Honda", color: "black"}

    assert make == "Honda"
  end

  koan "The pattern can make assertions about what it expects" do
    assert match?([1, _second, _third], [1, 2, 3])
  end

  # Rearrange to be the same order as assertions
  def make_noise(%{type: "cat"}), do: "Meow"
  def make_noise(%{type: "dog"}), do: "Woof"
  def make_noise(_anything), do: "Eh?"

  # Remove superfluous info
  koan "Functions can declare what kind of arguments they accept" do
    dog = %{type: "dog", legs: 4, age: 9, color: "brown"}
    cat = %{type: "cat", legs: 4, age: 3, color: "grey"}
    snake = %{type: "snake", legs: 0, age: 20, color: "black"}

    assert make_noise(dog) == "Woof"
    assert make_noise(cat) == "Meow"
    assert make_noise(snake) == "Eh?"
  end

  # Have a case for {:ok, found}
  koan "Errors are shaped differently than sucessful results" do
    result = case Map.fetch(%{}, :obviously_not_a_key) do
      :error -> "not present"
      _ -> flunk("I should not happen")
    end

    assert result == "not present"
  end
end
