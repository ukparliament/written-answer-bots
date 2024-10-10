require 'rails_helper'

describe "smoke test", type: :system, js: true, chrome: true do
  it 'home page loads' do
    visit root_path
    expect(page).to have_content("Written answers")
  end
end
