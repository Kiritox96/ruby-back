Given 'starting with no users' do
    User.delete_all
    assert_equal(0, User.count)
end

Given 'a new user' do
    @user = User.create(email: 'email@em.com', password: 'password', name:'name')
end

Then 'I can check the user' do
    assert_equal(1, @user.count)
end



