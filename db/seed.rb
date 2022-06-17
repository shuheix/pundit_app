# Company
Company.create(name: "SIMULA")

# Group
Group.create(name: "backend")
Group.create(name: "frontend")

# Account
accounts = [{
              name: "mackeee",
              email: "mackeee",
              password: "password",
              password_confirmation: "password",
              company_ids: Company.find(1).id,
              group_ids: Group.all.pluck(:id)
            },
            {
              name: "taku",
              email: "taku",
              password: "password",
              password_confirmation: "password",
              company_ids: Company.find(1).id,
              group_ids: Group.find(1).id
            },
            {
              name: "nozomi",
              email: "nozomi",
              password: "password",
              password_confirmation: "password",
              company_ids: Company.find(1).id,
              group_ids: Group.find(2).id
            },
            {
              name: "yossei",
              email: "yossei",
              password: "password",
              password_confirmation: "password",
              company_ids: Company.find(1).id,
              group_ids: Group.find(2).id
            },
            {
              name: "kazu",
              email: "kazu",
              password: "password",
              password_confirmation: "password",
              company_ids: Company.find(1).id,
              group_ids: Group.find(2).id
            },
            {
              name: "shuhei",
              email: "shuhei",
              password: "password",
              password_confirmation: "password",
              company_ids: Company.find(1).id,
              group_ids: Group.find(1).id
            },
            {
              name: "tateno",
              email: "tateno",
              password: "password",
              password_confirmation: "password",
              company_ids: Company.find(1).id,
            },
            {
              name: "hoge",
              email: "hoge",
              password: "password",
              password_confirmation: "password"
            }
]
Account.create(accounts)


# 会社にのみ紐づくノート
10.times do |n|
  Note.create(title: "#{n}_only_company",content: "#{n}_only_company", company: Company.find(1))
end

# 会社とグループに紐づくノート
10.times do |n|
  Note.create(title: "#{n}company_and_group", content: "#{n}company_and_group", company: Company.find(1), group: Group.find(1..2))
end

#

# 会社とグループに紐づくノート
