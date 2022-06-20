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

# role
Role.create([
              {name: "admin"},
              {name: "leader"},
              {name: "engineer"},
              {name: "common"}
            ])
#

mackeee = Account.find_by(email: "mackeee")
mackeee.add_role :admin
taku = Account.find_by(email: "taku")
taku.add_role :leader
nozomi = Account.find_by(email: "nozomi")
nozomi.add_role :leader
yossei = Account.find_by(email: "yossei")
yossei.add_role :engineer
kazu = Account.find_by(email: "kazu")
kazu.add_role :engineer
shuhei = Account.find_by(email: "shuhei")
shuhei.add_role :engineer
tateno = Account.find_by(email: "tateno")
tateno.add_role :common

# 会社にのみ紐づくノート
10.times do |n|
  Note.create(title: "#{n}_only_company",content: "#{n}_only_company", company: Company.find(1))
end

# 会社とグループに紐づくノート
10.times do |n|
  Note.create(title: "#{n}company_and_group", content: "#{n}company_and_group", company: Company.find(1), group: Group.find(rand(1..2)))
end

#

# 会社とグループに紐づくノート
