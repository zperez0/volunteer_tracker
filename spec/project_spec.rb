require 'spec_helper'

describe Project do
  describe '#title' do
    it 'returns the project title' do
      project = Project.new({:title => 'Teaching kids to code', :id => nil})
      expect(project.title).to eq 'Teaching kids to code'
    end
  end

  context '#id' do
    it 'returns the id of the project before saving project' do
      project = Project.new({:title => 'Teaching kids to code', :id => nil})
      expect(project.id).to eq nil
    end

    it 'returns the id of the project after saving project' do
      project = Project.new({:title => 'Teaching kids to code', :id => nil})
      project.save
      expect(project.id).to be_an_instance_of Integer
    end
  end

  describe '#==' do
    it 'is the same project if two projects have the same title' do
      project1 = Project.new({:title => 'Teaching kids to code', :id => nil})
      project2 = Project.new({:title => 'Teaching kids to code', :id => nil})
      expect(project1 == project2).to eq true
    end
  end

  context '.all' do
    it 'is empty to start' do
      expect(Project.all).to eq []
    end

    it 'returns all projects' do
      project1 = Project.new({:title => 'Teaching kids to code', :id => nil})
      project1.save
      project2 = Project.new({:title => 'Teaching ruby to kids', :id => nil})
      project2.save
      expect(Project.all).to eq [project1, project2]
    end
  end

  describe '#save' do
    it 'saves a project to the database' do
      project = Project.new({:title => 'Teaching kids to code', :id => nil})
      project.save
      expect(Project.all).to eq [project]
    end
  end

end