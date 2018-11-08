class UsersController < Clearance::UsersController
  
  def show    
    @user = User.find_by(id: params[:id])
    render 'users/show' 
  end
    private
 
    def user_from_params
      email = user_params.delete(:email)
      password = user_params.delete(:password)
      name = user_params.delete(:name)
      gender = user_params.delete(:gender)
      birthday = user_params.delete(:birthday)
      image = user_params.delete(:image)


      Clearance.configuration.user_model.new(user_params).tap do |user|
        user.email = email
        user.password = password
        user.name = name
        user.gender = gender
        user.birthday = birthday
        user.image = image


      end
    end
  
 
  end