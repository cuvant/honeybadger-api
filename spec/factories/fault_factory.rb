FactoryGirl.define do
  factory :fault, :class => Honeybadger::Api::Fault do
    id 1
    project_id 2
    klass "RuntimeError"
    action "runtime_error"
    component "pages"
    message "This is a runtime error"
    environment "production"
    ignored false
    resolved false
    notices_count 7
    comments_count 0
    last_notice_at "2012-01-01T00:02:00Z"
    created_at "2012-01-01T00:01:00Z"
    url "https://app.honeybadger.io/projects/2/faults/1"
    assignee nil
    tags ["internal"]
    association :deploy, :factory => :deploy, :strategy => :attributes_for

    initialize_with do
      new(attributes)
    end
  end

  factory :assigned_fault, :parent => :fault do
    association :assignee, :factory => :user, :strategy => :attributes_for
  end

  factory :ignored_fault, :parent => :fault do
    ignored true
  end

  factory :resolved_fault, :parent => :fault do
    resolved true
  end
end