require 'sinatra'
require 'sinatra/reloader'
require './lib/project'
require './lib/volunteer'
require 'pry'
require 'pg'
also_reload 'lib/**/*.rb'

DB = PG.connect({:dbname => 'volunteer_tracker'})

get '/' do
  redirect to '/projects'
end

get '/projects' do
  @projects = Project.all 
  erb :projects
end

post '/projects' do
  user_input = params[:title]
  if user_input.length > 0
    title = params[:title]
    project = Project.new({:title => title, :id => nil})
    project.save
    redirect to '/projects'
  else
    erb :error
  end
end

get '/projects/:id' do
  @project = Project.find(params[:id].to_i)
  erb :project
end

get '/projects/:id/edit' do
  @project = Project.find(params[:id].to_i)
  erb :edit_project
end

patch '/projects/:id' do
  @project = Project.find(params[:id].to_i)
  @project.update({:title => params[:title], :id => nil})
  redirect to '/projects'
end

delete '/projects/:id' do
  @project = Project.find(params[:id].to_i)
  @project.delete
  redirect to'/projects'
end

post '/projects/:id/volunteers' do
  @project = Project.find(params[:id].to_i)
  volunteer = Volunteer.new({:name => params[:volunteer_name], :project_id => @project.id, :id => nil})
  if volunteer.name.length > 0
  volunteer.save
  erb :project
  else
    erb :error
  end
end

get '/projects/:id/volunteers/:volunteer_id' do
  @volunteer = Volunteer.find(params[:volunteer_id].to_i)
  erb :volunteer
end

patch '/projects/:id/volunteers/:volunteer_id' do
  @project = Project.find(params[:id].to_i)
  volunteer = Volunteer.find(params[:volunteer_id].to_i)
  volunteer.update(params[:name], @project.id)
  erb :project
end

delete '/projects/:id/volunteers/:volunteer_id' do
  volunteer = Volunteer.find(params[:volunteer_id].to_i)
  volunteer.delete
  @project = Project.find(params[:id].to_i)
  erb :project
end