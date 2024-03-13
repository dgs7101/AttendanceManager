user = User.find_or_create_by!(email: 'user@example.com') do |user|
    user.username = '山田太郎'
    user.password = 'password'
    user.password_confirmation = 'password'
end

admin = Admin.find_or_create_by!(email: 'admin@example.com') do |admin|
    admin.password = 'password'
    admin.password_confirmation = 'password'
end