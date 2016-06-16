module MemberHelper

  # I need two conditions, (I think.)
  # If user isn't signed in, stay on page, flash not-created message.
  # If user is signed in, but doesn't have a guest/host role || they don't have a profile, redirect to profile show, then flash finish the process message

  def signed_in?
    if member_signed_in?
      'signed-in'
    else
      'not-signed-in'
    end
  end
end
