module KeysetsHelper
  def available_keysets_for(membership)
    (membership.keyset.nil? ? [] : [membership.keyset]) +
    Keyset.available
  end
end
