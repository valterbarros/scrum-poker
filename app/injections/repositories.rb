module Injections
  module Repositories

    def build_teamwork_adapter(url_base:, token:)
      Adapter.new(:teamwork, url_base, token, '')
    end

    def build_trello_adapter(url_base:, token:, key:)
      Adapter.new(:trello, url_base, token, key)
    end


    def provide_project_repo(adapter:)
      PROJECT_REPO[adapter.name].call(adapter)
    end

    def provide_list_repo(adapter:)
      LIST_REPO[adapter.name].call(adapter)
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

    PROJECT_REPO = {
      teamwork: -> (adapter) { ::Infrastructure::Remote::Project::Teamwork::ProjectApi.new(request_api: REQUESTS[:teamwork].call(adapter)) }
    }

    LIST_REPO = {
      teamwork: -> (adapter) { ::Infrastructure::Remote::List::Teamwork::ListApi.new(request_api: REQUESTS[:teamwork].call(adapter)) }
    }

    TASK_REPO = {
      teamwork: -> (adapter) { ::Infrastructure::Remote::Task::Teamwork::TaskApi.new(request_api: REQUESTS[:teamwork].call(adapter)) }
    }
  end
end
