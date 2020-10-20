class User < ApplicationRecord
    has_secure_password

    validates :email,{presence: true, uniqueness: true}

    validates :name,{presence: true}

    def posts
        return Post.where(user_id: self.id)
    end
    
end
