FactoryBot.define do
  factory :dog do
    id{1}
    name { "dog000000" }
    size {0}
    vehicle {0}
    cleaning {0}
    active {0}
    exercise {0}
    home {0}
    house {0}
  end

  factory :second_dog do
    id{2}
    name { "dog000000" }
    size {2}
    vehicle {1}
    cleaning {1}
    active {1}
    exercise {1}
    home {1}
    house {1}
  end
end