module DogsHelper
   def matching_result(dog)
    @user_choices = current_user.user_choice
    user_choices = [ @user_choices.vehicle, @user_choices.cleaning, @user_choices.active, @user_choices.exercise, @user_choices.home, @user_choices.house ]
    dog_choices = [ dog.vehicle, dog.cleaning, dog.active, dog.exercise, dog.home, dog.house ]
    @matching = (dog_choices & user_choices).length*100/6.round(-1)
  end
end
