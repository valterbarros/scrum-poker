module Injections
  module Repositories

    def provide_task_repo(adapter:)
      TASK_REPO[adapter.name].call(adapter)
    end

    private
    RequestApi = Struct(:headers, :body_params)
    REQUESTS = {
      teamwork: -> (adapter) { RequestApi.new(headers: {'Authorization': "Basic #{adapter.token}"}, body_params: {}) },
      trello:   -> (adapter) { RequestApi.new(headers: {}, body_params: "key=#{adapter.key}&token=#{adapter.token}") }
    }

    TASK_REPO = {
      teamwork: -> (adapter) { ::Infrastructure::Remote::Task::Teamwork::TaskApi.new(request_api: REQUESTS[:teamwork].call(adapter)) },
      trello:   -> (adapter) { ::Infrastructure::Remote::Task::Trello::TaskApi.new(request_api: REQUESTS[:trello].call(adapter)) }
    }
  end
end

# trello token: 75bce39b08cc77d16bc652c24540665851fdc4763c7dda183570857ab8fe3abc
# trello key: 92eab9af2b2a2e2066940fb5796490df
# curl 'https://api.trello.com/1/members/me/boards?key=92eab9af2b2a2e2066940fb5796490df&token=75bce39b08cc77d16bc652c24540665851fdc4763c7dda183570857ab8fe3abc'
#
# curl 'https://api.trello.com/1/members/me/boards?key=92eab9af2b2a2e2066940fb5796490df&token=75bce39b08cc77d16bc652| 18
# ▸ db/                         |~'
