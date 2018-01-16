class Admin::TemplatesController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @templates = Template.all
  end

  def new
    @template = Template.new
    @templatephoto = @template.templatephotos.build
  end

  def show
    @template = Template.find(params[:id])
  end

  def edit
    @template = Template.find(params[:id])
  end

  def create
    @template = Template.new(template_params)

    if @template.save
      if params[:templatephotos] != nil
        params[:templatephotos]['image'].each do |a|
          @templatephoto = @template.templatephotos.create(:image => a)
        end
      end
      redirect_to admin_templates_path
    else
      render :new
    end
  end

  def update
    @template = Template.find(params[:id])

    if @template.update(template_params)
      redirect_to admin_templates_path
    else
      render :edit
    end
  end

  def destroy
    @template = Template.find(params[:id])
    @template.destroy
    redirect_to admin_templates_path, alert: 'Template Deleted'
  end

  private

  def template_params
    params.require(:template).permit(:title, :description, :price, :version, :proportion, templatephoto_attributes: [:image, :id])
  end
end
