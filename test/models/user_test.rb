# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#following? should return true if receiver follow argument' do
    me = User.new(email: 'foo@example.com', password: 'password')
    me.save!
    she = User.new(email: 'hoge@example.com', password: 'password')
    she.save!

    me.follow(she)
    assert me.following?(she)
  end

  test 'followed_by? should return true if receiver are followed by argument' do
    me = User.new(email: 'foo@example.com', password: 'password')
    me.save!
    she = User.new(email: 'hoge@example.com', password: 'password')
    she.save!

    me.follow(she)
    assert she.followed_by?(me)
  end

  test '#follow should return true when receiver followed argument' do
    me = User.new(email: 'foo@example.com', password: 'password')
    me.save!
    she = User.new(email: 'hoge@example.com', password: 'password')
    she.save!

    assert_not me.following?(she)
    me.follow(she)
    assert me.following?(she)
  end

  test '#unfollow should return true when argument are unfollowed' do
    me = User.new(email: 'foo@example.com', password: 'password')
    me.save!
    she = User.new(email: 'hoge@example.com', password: 'password')
    she.save!

    me.follow(she)
    assert me.following?(she)
    me.unfollow(she)
    assert_not me.following?(she)
  end

  test '#name_or_email should return name or email' do
    user = User.new(name: '', email: 'foo@example.com')
    assert_equal 'foo@example.com', user.name_or_email

    user2 = User.new(name: 'Foo Bar', email: 'foo@example.com')
    assert_equal 'Foo Bar', user2.name_or_email
  end
end
