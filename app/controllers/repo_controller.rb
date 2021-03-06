class RepoController < ApplicationController
  before_filter :repo_lost 
  before_filter :admin_login,:only=> ["edit","update","readme_en"]
  def index
    @lang = params[:lang] || (@item.about_zh.blank? ? 'en' : 'zh')
    @comment = {:typ=> 'REPO',:idcd=> @item.id}
  end 

  def commits
    @readmes = @item.readmes
  end

  def diff
    @readme = Readme.find_by_id(params[:oid])
  end

  def readme
  	render :layout=> "blank"
  end

  def readme_en 
    respond_to do |format|
      format.html{ 
        render :layout=> "blank"
      }
      format.json { 
        @item.update_attributes({:about=> params[:markdown]})
        redirect_to request.referer 
      }
    end
  end

  def update
    _typ = params[:typ].split("-")
    params[:repo][:rootyp] = _typ[0]
    params[:repo][:typcd] = _typ[1..-1].join('-')
    #params[:repo][:about_zh] = "" if params[:repo][:about_zh].gsub(/<\w>\s+?<\/\w>/,"") == ""
    @item.update_attributes(params.require(:repo).permit(Repo.attribute_names))
    redirect_to request.referer 
  end

  def resources
    _items = @item.repo_resources
    if current_mem
      _items = _items.where("recsts = '0' or mem_id = ?",current_mem.id)
    else
      _items = _items.where({:recsts=> '0'})
    end
    render json:{items:  _items}
  end
end
