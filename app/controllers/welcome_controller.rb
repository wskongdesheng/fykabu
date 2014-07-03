# encoding: utf-8
class WelcomeController < ApplicationController
  def index
    dir = Rails.root.join("public", "pictures").to_s
    folders = Dir.glob("#{dir}/*").select {|f| File.directory? f}
    @projects = []
    folders.each do |f|
      @projects << f.gsub("#{dir}/", '')
    end
    @projects = @projects.sort unless @projects.blank?
  end

  def yearlist
    sleep 1
    project = params[:project]
    if project.blank?
      render :json => {:status => 'failed', :message => 'Params can not be blank!'} and return
    end
    dir = Rails.root.join("public", "pictures", project).to_s
    folders = Dir.glob("#{dir}/*").select {|f| File.directory? f}
    list = []
    folders.each do |f|
      list << f.gsub("#{dir}/", '')
    end
    if list.blank?
      render :json => {:status => 'failed', :message => 'Empty folder!'}
    else
      list = list.sort
      render :json => {:status => 'success', :message => '', :response => list.reverse}
    end
  end

  def datelist
    sleep 1 # useless, just for better view
    project = params[:project]
    path = params[:path]
    if project.blank? or path.blank?
      render :json => {:status => 'failed', :message => 'Params can not be blank!'} and return
    end
    dir = Rails.root.join("public", "pictures", project, path).to_s
    folders = Dir.glob("#{dir}/*").select {|f| File.directory? f}
    list = []
    folders.each do |f|
      list << "#{path}-" + f.gsub("#{dir}/", '')
    end
    if list.blank?
      render :json => {:status => 'failed', :message => 'Empty folder!'}
    else
      list = list.sort
      render :json => {:status => 'success', :message => '', :response => list.reverse}
    end
  end

  def picture
    sleep 1 # useless, just for better view
    project = params[:project]
    datetime = params[:datetime]
    if project.blank? or datetime.blank?
      render :json => {:status => 'failed', :message => 'Params can not be blank!'} and return
    end
    if datetime.size < 6
      render :json => {:status => 'failed', :message => 'Folder name error!'} and return
    end
    year = datetime[0..3]
    name = datetime[5..datetime.size]
    dir = Rails.root.join("public", "pictures", project, year, name).to_s
    files = Dir.glob("#{dir}/*").select {|f| File.file? f }

    list = []
    pics = []
    files = files.sort unless files.blank?
    files.each do |f|
      fn = f.gsub("#{dir}/", '')
      if ['.jpg', '.png', '.gif', '.jpeg', '.bmp'].include?(File.extname(f))
        pics << root_path + "pictures/#{project}/#{year}/#{name}/" + fn
      else
        list << {
          :name => fn,
          :path => root_path + "pictures/#{project}/#{year}/#{name}/" + fn
        }
      end
    end

    if list.blank? and pics.blank?
      render :json => {:status => 'failed', :message => 'Empty folder!'}
    else
      render :json => {:status => 'success', :message => '', :response => {:pics => pics, :files => list}}
    end
  end
end
