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
end
