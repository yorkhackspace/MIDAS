module SsoUsersHelper
  def auths_hash
    SsoUserAuthorisation.all.map { |auth|
      [auth.description, auth.id]
    }.to_h
  end
end
