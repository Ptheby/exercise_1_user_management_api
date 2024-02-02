class User < ApplicationRecord


    validates :name, presence: true, length:{minimum:3, maximum:50}
    validates :email, presence: true, uniqueness: true, length:{minimum:5, maximum:255} ,format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :age, presence: true, numericality:true, 
    before_save {self.email = email.downcase}

 
  

end
