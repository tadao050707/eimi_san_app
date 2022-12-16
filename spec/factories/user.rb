FactoryBot.define do
  factory :user do
    id{1}
    name { 'testuser' }
    email { 'tesusert@gmail.com' }
    password { 'testuser' }
    admin { false }
  end

  factory :second_user, class: User do
    id {2}
    name { 'testuser2' }
    email { 'testuser2@example.com' }
    password { 'testuser2pass' }
    admin { false }
  end

  factory :admin_user, class: User do
    id {3}
    name { 'testadmin' }
    email { 'testadmin@example.com' }
    password { 'testadmin' }
    admin { true }
  end
end