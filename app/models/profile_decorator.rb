class ProfileDecorator

  def initialize(profile)
    @profile = profile
  end

  def name
    "#{@profile.first_name} #{@profile.last_name}"
  end

  def smoking_status
    if @profile.smoker? == false
      "is not a smoker"
    else
      "is a smoker"
    end
  end

  def pet_status
    if @profile.smoker? == false
      "is not a pet owner"
    else
      "is a pet owner"
    end
  end

  def image
    @profile.image
  end

  def complete?
    if @profile.attributes.values.select {|v| v == nil }.length > 0
      false
    else
      true
    end
  end

  def profile_status
    if @profile.complete?
      render 'profile_complete'
    else
      render 'profile_incomplete'
    end
  end

  def percent_complete
    if @profile.complete?
      'onehundred'
    end
  end
end
