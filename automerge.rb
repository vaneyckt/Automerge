require './lib/github.rb'
require './lib/helpers.rb'

while true
  begin
    config = ConfigFile.read
    open_pull_requests_ids = Github.get_open_pull_requests_ids

    open_pull_requests_ids.each do |pull_request_id|
      pull_request = Github.get_pull_request(pull_request_id)

      is_auto_mergeable = true
      is_auto_mergeable = is_auto_mergeable && (pull_request[:merged] == false)
      is_auto_mergeable = is_auto_mergeable && (pull_request[:mergeable] == true)
      is_auto_mergeable = is_auto_mergeable && (pull_request[:status] == 'success')
      is_auto_mergeable = is_auto_mergeable && (pull_request[:submitter] == config[:observed_user])

      Github.merge_pull_request(pull_request_id) if is_auto_mergeable
    end
  rescue => e
    Logger.log('Error in main loop', e)
  end
  sleep config[:github_polling_interval_seconds]
end
