json.array!(@work_plans) do |work_plan|
  json.extract! work_plan, :id, :name, :description, :is_standard
  json.url work_plan_url(work_plan, format: :json)
end
