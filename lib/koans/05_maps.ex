defmodule Maps do
  use Koans

  @person %{
    name: "Jon",
    last_name: "Snow",
    age: 27
  }

  koan "Maps represent structured data, like a person" do
    assert @person == %{name: ___,
                        last_name: "Snow",
                        age: 27 }
  end

  koan "A map has keys and values" do
    assert Map.keys(@person) |> Enum.sort == ___
    assert Map.values(@person) |> Enum.sort == ___
  end

  koan "Fetching a value returns a tuple with ok when it exists" do
    assert Map.fetch(@person, :age) == ___
  end

  koan "Or the atom :error when it doesnt" do
    assert Map.fetch(@person, :family) == ___
  end

  koan "Extending a map is a simple as putting in a new pair" do
    person_with_hobby = Map.put(@person, :hobby, "Kayaking")
    assert Map.fetch(person_with_hobby, :hobby) == ___
  end

  koan "Put can also overwrite existing values" do
    older_person = Map.put(@person, :age, 37)
    assert Map.fetch(older_person, :age) == ___
  end

  koan "Or you can use some syntactic sugar for existing elements" do
    younger_person = %{ @person | age: 16 }
    assert Map.fetch(younger_person, :age) == ___
  end

  koan "Can remove pairs by key" do
    without_age = Map.delete(@person, :age)
    assert Map.keys(without_age) |> Enum.sort == ___
  end

  koan "Can merge maps" do
    assert Map.merge(%{name: "Jon"}, %{last_name: "Snow"}) == ___
  end

  koan "When merging, the last map wins" do
    merged = Map.merge(@person, %{ last_name: "Baratheon"})
    assert Map.fetch(merged, :last_name) == ___
  end

  koan "You can also select sub-maps out of a larger map" do
    initial = %{ name: "Jon", last_name: "Snow", age: 15}
    assert Map.take(initial, [:name, :last_name]) == ___
  end
end
