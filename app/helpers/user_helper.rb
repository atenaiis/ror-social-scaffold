module UserHelper
    def all_users
      User.select { |x| x.id != current_user.id }
    end
end    