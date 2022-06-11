include .env
export

# ENV
DC = COMPOSE_FILE=docker-compose.yml docker-compose
DC_APP = $(DC) exec app
RAILS_C = $(DC_APP) rails
M1_DC = COMPOSE_FILE=docker-compose.m1.yml docker-compose
M1_DC_APP = $(M1_DC) exec app
M1_RAILS_C = $(M1_DC_APP) rails

# GCP ENV
export GOOGLE_CREDENTIALS

# Terraform ENV
TF_CD = [[ -d terraform/envs/$(TERRAFORM_ENV) ]] && cd terraform/envs/$(TERRAFORM_ENV)

# ファイルバリデーション
.env:
	@echo "Need .env file in root directory"
	@echo "You can refer .env.sample"
	@exit 1
check-files: .env

# コンテナ操作コマンド
.PHONY: bundle up build_up down logs clean
build:
	@sh ./set_dot_env.sh
	$(DC) build
up:
	@sh ./set_dot_env.sh
	$(DC) up -d
build_up:
	@sh ./set_dot_env.sh
	$(DC) up -d --build
restart:
	@sh ./set_dot_env.sh
	$(DC) restart
force_restart:
	@sh ./set_dot_env.sh
	@make down
	@make build_up
down:
	$(DC) down
logs:
	$(DC) logs -f

# M1用
m1build:
	@sh ./set_dot_env.sh
	$(M1_DC) build
m1up:
	@sh ./set_dot_env.sh
	$(M1_DC) up -d
m1build_up:
	@sh ./set_dot_env.sh
	$(M1_DC) up -d --build
m1restart:
	@sh ./set_dot_env.sh
	$(M1_DC) restart
m1force_restart:
	@sh ./set_dot_env.sh
	@make m1down
	@make m1build_up
m1down:
	$(M1_DC) down
m1logs:
	$(M1_DC) logs -f

# bundle関連コマンド
.PHONY: bundle_install bundle_remove
bundle_install: check-files
	@$(DC_APP) bundle install -j 4
bundle_remove:
	@$(DC_APP) gem uninstall -aIx
	@make bundle_install

rails_env_check:
	@$(eval MAKE_RAILS_ENV := $(shell read -p "RAILS_ENV? (development, test): " RENV; echo $$RENV))
	@echo "run command in $(MAKE_RAILS_ENV)"

# rails関係コマンド
.PHONY: rails_c rails_routes rspec rubocop rubocop_a erd
rails_c: check-files
	@$(RAILS_C) console
rails_routes: check-files
	@$(RAILS_C) routes
rspec: check-files
	@$(DC) exec -e DB_NAME=coadmap_test -e RAILS_ENV=test app bundle exec rspec
rubocop: check-files
	@$(DC_APP) bundle exec rubocop
rubocop_a: check-files
	@$(DC_APP) bundle exec rubocop -A
erd: check-files
	@$(DC_APP) bundle exec erd
test:
	@make rspec

# M1用
m1rails_c: check-files
	@$(M1_RAILS_C) console
m1rails_routes: check-files
	@$(M1_RAILS_C) routes
m1rspec: check-files
	@$(M1_DC) exec -e DB_NAME=coadmap_test -e RAILS_ENV=test app bundle exec rspec
m1rubocop: check-files
	@$(M1_DC_APP) bundle exec rubocop
m1rubocop_a: check-files
	@$(M1_DC_APP) bundle exec rubocop -A
m1erd: check-files
	@$(M1_DC_APP) bundle exec erd
m1test:
	@make m1rspec

# rails generatorコマンド
.PHONY: rails_g_model rails_g_migration
buf_model_name:
	@$(eval MODEL_NAME := $(shell read -p "Input model name: " BUF; echo $$BUF))

buf_migrate_label:
	@$(eval MIGRATE_LABEL := $(shell read -p "Input action and class label(like XxxYyy): " BUF; echo $$BUF))

rails_g_model: buf_model_name
	@$(RAILS_C) g model $(MODEL_NAME)

rails_g_migration: buf_migrate_label
	@$(RAILS_C) g migration $(MIGRATE_LABEL)

# M1用
m1rails_g_model: buf_model_name
	@$(M1_RAILS_C) g model $(MODEL_NAME)

m1rails_g_migration: buf_migrate_label
	@$(M1_RAILS_C) g migration $(MIGRATE_LABEL)

# DB関連コマンド
.PHONY: db_create db_migrate db_seed
db_set_environ:
	@$(RAILS_C) db:environment:set RAILS_ENV=$(RAILS_ENV)
db_create: check-files
	@$(RAILS_C) db:create
db_migrate: check-files rails_env_check
	@$(RAILS_C) db:migrate RAILS_ENV=$(MAKE_RAILS_ENV)
db_seed: check-files
	@$(RAILS_C) db:seed
db_migrate_seed: check-files
	@$(RAILS_C) db:migrate db:seed
db_drop: check-files
	@$(RAILS_C) db:drop
db_migrate_reset: check-files
	@$(RAILS_C) db:migrate:reset
db_rollback: check-files rails_env_check
	@$(RAILS_C) db:rollback RAILS_ENV=$(MAKE_RAILS_ENV)
db_reset: check-files
	@$(RAILS_C) db:reset

# M1用
m1db_set_environ:
	@$(M1_RAILS_C) db:environment:set RAILS_ENV=$(RAILS_ENV)
m1db_create: check-files
	@$(M1_RAILS_C) db:create
m1db_migrate: check-files rails_env_check
	@$(M1_RAILS_C) db:migrate RAILS_ENV=$(MAKE_RAILS_ENV)
m1db_seed: check-files
	@$(M1_RAILS_C) db:seed
m1db_migrate_seed: check-files
	@$(M1_RAILS_C) db:migrate db:seed
m1db_drop: check-files
	@$(M1_RAILS_C) db:drop
m1db_migrate_reset: check-files
	@$(M1_RAILS_C) db:migrate:reset
m1db_rollback: check-files rails_env_check
	@$(M1_RAILS_C) db:rollback RAILS_ENV=$(MAKE_RAILS_ENV)
m1db_reset: check-files
	@$(M1_RAILS_C) db:reset
