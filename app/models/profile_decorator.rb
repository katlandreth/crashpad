class ProfileDecorator
  # include ActionView::Helpers::UrlHelper
  # include ActionView::Helpers::CaptureHelper
  # include Rails.application.routes.url_helpers

  def initialize(profile)
    @profile = profile
  end

  def name
    "#{@profile.first_name} #{@profile.last_name}"
  end

  def smoking_status
    if @profile.smoker? == false
      "not a smoker"
    else
      "smoker"
    end
  end

  def pet_status
    if @profile.smoker? == false
      "not a pet owner"
    else
      "pet owner"
    end
  end

  def image
    @profile.image
  end

  def image?
    @profile.image?
  end

  def id
    @profile.id
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
