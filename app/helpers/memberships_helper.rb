module MembershipsHelper
  def human_for_membership_status(status)
    case status
    when "active"
      "Active"
    when "new"
      "New"
    when "unpaid"
      "Outstanding unpaid subscription dues"
    when "left_outstanding"
      "Left, with keys or deposit to return"
    when "left_closed_off"
      "Left, all closed off"
    else
      "Unknown!"
    end
  end
end
