require 'octokit'
require './lib/helpers.rb'

module Github
  def Github.get_open_pull_requests_ids
    begin
      config = ConfigFile.read
      repository_id = Repository.get_id
      client = Octokit::Client.new(:login => config[:github_login], :password => config[:github_password])
      open_pull_requests = client.pull_requests(repository_id, 'open')
      open_pull_requests_ids = open_pull_requests.collect { |pull_request| pull_request.number }
    rescue => e
      Logger.log('Error when getting open pull requests ids', e)
    end
  end

  def Github.get_pull_request(pull_request_id)
    begin
      config = ConfigFile.read
      repository_id = Repository.get_id
      client = Octokit::Client.new(:login => config[:github_login], :password => config[:github_password])
      pull_request = client.pull_request(repository_id, pull_request_id)
      statuses = client.statuses(repository_id, pull_request.head.sha)

      data = {}
      data[:id] = pull_request.number
      data[:merged] = pull_request.merged
      data[:mergeable] = pull_request.mergeable
      data[:head_sha] = pull_request.head.sha
      data[:head_branch] = pull_request.head.ref
      data[:base_sha] = pull_request.base.sha
      data[:base_branch] = pull_request.base.ref
      data[:status] = statuses.empty? ? 'undefined' : statuses.first.state
      data[:submitter] = pull_request.user.login
      data
    rescue => e
      Logger.log('Error when getting pull request', e)
    end
  end

  def Github.merge_pull_request(pull_request_id)
    begin
      config = ConfigFile.read
      repository_id = Repository.get_id
      client = Octokit::Client.new(:login => config[:github_login], :password => config[:github_password])
      client.merge_pull_request(repository_id, pull_request_id)
    rescue => e
      Logger.log('Error when merging pull request', e)
    end
  end
end
