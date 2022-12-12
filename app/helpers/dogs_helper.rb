module DogsHelper
   def matching_result(dog)
    @user_choices = current_user.user_choice
    user_choices = [ @user_choices.vehicle, @user_choices.cleaning, @user_choices.active, @user_choices.exercise, @user_choices.home, @user_choices.house ]
    dog_choices = [ dog.vehicle, dog.cleaning, dog.active, dog.exercise, dog.home, dog.house ]
    matching_count = 0
    user_choices.each_with_index do |user_choice, i|
      matching_count += 1 if user_choice == dog_choices[i]
    end
    @matching = (matching_count * 100/6).round(-1)
  end
end
