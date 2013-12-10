include ApplicationHelper

RSpec::Matchers.define :have_error_message do | msg |
	match do | page |
		expect(page).to have_selector("div.alert.alert-error", text: msg)
	end
end

RSpec::Matchers.define :have_success_message do | msg |
	match do | page |
		expect(page).to have_selector("div.alert.alert-success", text: msg)
	end
end

def sign_in(user)
    visit new_user_session_path
    fill_in "Email",    with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
end



