# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Respoinding to friend requests', type: :feature do
  scenario 'After accepting another user\'s friend request they will appear in your friend list' do
    register_u1_and_create_post
    click_link 'Sign Out'
    register_u2_and_create_post
    click_link 'Timeline'
    click_link 'Test123'
    click_link 'Add as friend'
    click_link 'Sign Out'
    sign_in
    click_link 'Timeline'
    click_link 'Testy123'
    click_link 'friend request'
    click_link 'Accept Friend Request'
    click_link 'Profile'
    click_link 'Friend List'
    expect(page).to have_content 'behold, all of my friends:'
    expect(page).to have_content 'Testy123'
  end

  scenario 'After accepting friend request you will appear in their friend list and the add friend button is hidden' do
    create_friend_request
    click_link 'Accept Friend Request'
    click_link 'Timeline'
    click_link 'Testy123'
    expect(page).to have_content 'You are friends with Testy123'
    expect(page).not_to have_link 'Add as friend'
    click_link 'Friend List'
    expect(page).to have_content 'behold, all of my friends:'
    expect(page).to have_content 'Test123'
  end

  scenario 'After rejecting another user\'s friend request they will not appear in your friend list' do
    create_friend_request
    click_link 'Decline Friend Request'
    click_link 'Profile'
    click_link 'Friend List'
    expect(page).to have_content 'behold, all of my friends:'
    expect(page).not_to have_content 'Testy123'
  end

  scenario 'After rejecting friend request you will not appear in friend list and add friend button is visible ' do
    create_friend_request
    click_link 'Decline Friend Request'
    click_link 'Timeline'
    click_link 'Testy123'
    expect(page).not_to have_content 'You are friends with Testy123'
    expect(page).to have_link 'Add as friend'
    click_link 'Friend List'
    expect(page).to have_content 'behold, all of my friends:'
    expect(page).not_to have_content 'Test123'
  end

  scenario 'Names in the friend list are functioning links that will take you to a user\'s profile page' do
    create_friend_request
    click_link 'Accept Friend Request'
    click_link 'Profile'
    click_link 'Friend List'
    expect(page).to have_link 'Testy123'
    click_link 'Testy123'
    expect(page).to have_content "Testy123's profile page"
    expect(page).to have_content 'You are friends with Testy123'
  end
end
