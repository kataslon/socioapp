module FormHelper

  def sign_in(user, options={})
    visit log_in_path
    fill_in "Email",    with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
  end
end
