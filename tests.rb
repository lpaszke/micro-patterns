require "test/unit"

require 'micro-patterns'

class FlagTest < Test::Unit::TestCase
  
  class Conference
    extend Patterns
  
    flag :activeness do |flag|
      flag.set = :activate
      flag.unset = :deactivate
      flag.is_set = :active?
      flag.is_unset = :not_active?
    end
  
  end
  
  def test_flag
    conference = Conference.new
    assert_equal(conference.not_active?, true)    
    conference.activate
    assert_equal(conference.active?, true)
    assert_equal(conference.not_active?, false)
    conference.deactivate
    assert_equal(conference.active?, false)
    assert_equal(conference.not_active?, true)
  end
 
end