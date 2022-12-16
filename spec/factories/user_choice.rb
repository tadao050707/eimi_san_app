FactoryBot.define do
  factory :user_choice do
    id {1}
    user_id{1}
    vehicle {0}
    cleaning {0}
    active {0}
    exercise {0}
    home {0}
    house {0}
  end

  factory :second_user_choice do
    id{2}
    user_id{2}
    vehicle {1}
    cleaning {1}
    active {1}
    exercise {1}
    home {1}
    house {1}
  end
end