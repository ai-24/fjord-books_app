# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test "#editable?(target_user) should return true when target_user is the user" do
    user = User.new(email: 'foo@example.com', password: 'password')
    user.save!
    user2 = User.new(email: 'hoge@example.com', password: 'password')
    user2.save!

    report = Report.new(title: 'Rails', content: 'fun to learn',user_id: user.id)
    report.save!
    assert report.editable?(user)
    assert_not report.editable?(user2)

  end

  test "#created_on should return day of week, day month year" do
    user = User.new(email: 'foo@example.com', password: 'password')
    user.save!
    report = Report.new(title: 'Rails', content: 'fun to learn',user_id: user.id)
    report.save!

    assert_equal Date.today, report.created_on
  end
end
