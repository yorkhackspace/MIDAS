module PersonsHelper
  def persons_who_havent_completed(wizard)
    Person.all.reject do |person|
      person.completed_wizards.map(&:wizard).include?(wizard)
    end
  end
end
