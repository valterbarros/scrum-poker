module Injections
  module Repositories

    def build_teamwork_adapter(url_base:, token:)
      Adapter.new(:teamwork, url_base, token, '')
    end

    def build_trello_adapter(url_base:, token:, key:)
      Adapter.new(:teamwork, url_base, token, key)
    end

    def provide_task_repo(adapter:)
      TASK_REPO[adapter.name].call(adapter)
    end

    private
    Adapter = Struct.new(:name, :url_base, :token, :key)

    RequestApi = Struct.new(:url_base, :headers, :body_params, :user)
    REQUESTS = {
      teamwork: -> (adapter) { RequestApi.new(adapter.url_base, {}, {}, adapter.token) },
      trello:   -> (adapter) { RequestApi.new(adapter.url_base, {}, "key=#{adapter.key}&token=#{adapter.token}") }
    }

    TASK_REPO = {
      teamwork: -> (adapter) { ::Infrastructure::Remote::Task::Teamwork::TaskApi.new(request_api: REQUESTS[:teamwork].call(adapter)) },
      trello:   -> (adapter) { ::Infrastructure::Remote::Task::Trello::TaskApi.new(request_api: REQUESTS[:trello].call(adapter)) }
    }
  end
end
