require 'logger'
require 'sinatra/base'
require 'haml'
require 'json'
require 'time'
require_relative 'kudos'
require_relative 'awards'
$stdout.sync = true

class App < Sinatra::Base
  enable :static
  set :public_folder, File.dirname(__FILE__) + '/public'
  set :root, File.join(File.dirname(__FILE__))
  set :port, 80
  get '/' do
    'healthy'
  end


  get '/fe/:contributor' do |contributor|
    @user = contributor
    @kudos = Kudos.new.contributions(contributor) || []
    num_issues_created = @kudos.select{|contrib| contrib["ContributionType"] == "Issue"}.length
    num_prs_created = @kudos.select{|contrib| contrib["ContributionType"] == "PullRequest"}.length
    @awards = Awards.all.select{|a| a.eligible?(num_issues_created)}
    haml :kudos
  end
end
