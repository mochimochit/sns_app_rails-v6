class User < ApplicationRecord
    # validates :name, {presence: true}
    # validates :email, {presence: true, uniqueness: true}
    # validates :password, {presence: true}
    has_one_attached :avatar

    def thumbnail
        return self.avatar.variant(resize: '300x300').processed
    end
end
