class User::MoviesController < User::UsersController
	before_filter :comprobate_token
	before_action :object, only: [:destroy,:show,:edit,:update]

  def index
    @q = Movie.ransack(params[:q])
    @movies = @q.result(distinct: true).paginate(:page => params[:page]).per_page(10)
    render json: @movies.collect{|i| {image: i.image,title: i.title,creation_date: i.creation_date}}
  end 

  def new
    @movies = Movie.new
  end

  def create
    @movie = Movie.new(movie_params(params[:character])) 
    if @movie.save
      render json: { success: I18n.t('global.successfully_created') }
    else
      render json: {success: I18n.t('global.unsuccessfully_created')}
    end
  end

  def show
  	render json: @movie.attributes
  end	

  def edit
  	render json: @movie.attributes
  end

  def update  	
  	if @movie.update(movie_params(params))
  		render json: {success: I18n.t("global.successfully_updated")}
  	else
			render json: {success: I18n.t("global.unsuccessfully_updated")}  	
  	end	
  end

  def destroy
    @movie.destroy
    render json: {success: I18n.t('global.successfully_deleted')}
  end

  private

  def object
    @movie = Movie.where(id: params[:id]).last
  end

  def movie_params params
    params.permit(
    	:image,
      :title,
      :creation_date,
      :qualification,
      :category_id
    ) 
  end
end	