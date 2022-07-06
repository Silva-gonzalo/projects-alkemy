class User::CharactersController < User::UsersController
	before_filter :comprobate_token
	before_action :object, only: [:destroy,:show,:edit,:update]

  def index
    @q = Character.ransack(params[:q])
    @characters = @q.result(distinct: true).paginate(:page => params[:page]).per_page(10)
    render json: @characters.collect{|i| {image: i.image,name: i.name}}
  end 

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params(params[:character])) 
    if @character.save
      render json: { success: I18n.t('global.successfully_created') }
    else
      render json: {success: I18n.t('global.unsuccessfully_created')}
    end
  end

  def show
  	render json: @character.attributes
  end	

  def edit
  	render json: @character.attributes
  end

  def update  	
  	if @character.update(character_params(params))
  		render json: {success: I18n.t("global.successfully_updated")}
  	else
			render json: {success: I18n.t("global.unsuccessfully_updated")}  	
  	end	
  end

  def destroy
    @character.destroy
    render json:{ success: I18n.t('global.successfully_deleted') }
  end

  private

  def object
    @character = Character.where(id: params[:id]).last
  end

  def character_params params
    params.permit(
    	:image,
      :name,
      :age,
      :weight,
      :history
    ) 
  end

end	