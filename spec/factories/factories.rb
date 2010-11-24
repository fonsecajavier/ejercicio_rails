Factory.define :account do |f|
  f.sequence(:name) { |n| "name#{n}" }
  f.bank_name  {"bank"}
end

Factory.define :employee do |f|
  f.sequence(:first_name) { |n| "First name #{n}" }
  f.sequence(:last_name) { |n| "Last name #{n}" }
  f.salary {1_550_000}
  f.association :account
end
