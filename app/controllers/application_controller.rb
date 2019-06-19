class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

	# サインアップ後、ユーザページへリダイレクトする
	def after_sign_up_path_for(resource)
		user_path(current_user.id)
	end
	# サインイン後、トップページへリダイレクトする
	def after_sign_in_path_for(resource)
		user_path(current_user.id)
	end

  	protected

	def configure_permitted_parameters #deviseでNameを登録するのに必要な記述
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  	end
end
