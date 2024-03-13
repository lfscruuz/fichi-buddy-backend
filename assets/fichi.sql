CREATE TABLE IF NOT EXISTS "bank_accounts" (
	"id" int NOT NULL UNIQUE DEFAULT '',
	"user_id" int NOT NULL DEFAULT '',
	"health_indicator_id" int NOT NULL,
	"balance" decimal NOT NULL DEFAULT '',
	"credit_limit" decimal NOT NULL DEFAULT '',
	"consumed_credit" decimal NOT NULL DEFAULT '',
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "users" (
	"id" int NOT NULL UNIQUE DEFAULT '',
	"first_name" varchar(255) NOT NULL DEFAULT '',
	"last_name" varchar(255) NOT NULL DEFAULT '',
	"cpf" varchar(11) NOT NULL DEFAULT '',
	"username" varchar(255) NOT NULL DEFAULT '',
	"password" varchar(255) NOT NULL DEFAULT '',
	"image_path" int NOT NULL DEFAULT '',
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "methods" (
	"id" int NOT NULL UNIQUE DEFAULT '',
	"name" varchar(255) NOT NULL DEFAULT '',
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "transaction_types" (
	"id" int NOT NULL UNIQUE DEFAULT '',
	"name" varchar(255) NOT NULL DEFAULT '',
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "events" (
	"id" int NOT NULL UNIQUE DEFAULT '',
	"account_id" int NOT NULL DEFAULT '',
	"method_id" int NOT NULL DEFAULT '',
	"transaction_type_id" int NOT NULL DEFAULT '',
	"recurrence_type_id" int NOT NULL,
	"name" int NOT NULL DEFAULT '',
	"value" decimal NOT NULL DEFAULT '',
	"counterparty" varchar(255) NOT NULL DEFAULT '',
	"installment_amount" int DEFAULT '',
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "recurrence_types" (
	"id" int NOT NULL UNIQUE DEFAULT '',
	"account_id" int NOT NULL DEFAULT '',
	"name" varchar(255) NOT NULL DEFAULT '',
	"start_date" datetime NOT NULL DEFAULT '',
	"end_date" datetime DEFAULT '',
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "health_indicator" (
	"id" int NOT NULL UNIQUE DEFAULT '',
	"name" varchar(255) NOT NULL DEFAULT '',
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "wishlist" (
	"id" int NOT NULL UNIQUE DEFAULT '',
	"account_id" int NOT NULL,
	"method_id" int NOT NULL DEFAULT '',
	"transaction_type_id" int NOT NULL DEFAULT '',
	"recurrence_type_id" int NOT NULL,
	"name" varchar(255) NOT NULL DEFAULT '',
	"value" decimal NOT NULL DEFAULT '',
	"counterpart" varchar(255) NOT NULL DEFAULT '',
	PRIMARY KEY ("id")
);

ALTER TABLE "bank_accounts" ADD CONSTRAINT "bank_accounts_fk1" FOREIGN KEY ("user_id") REFERENCES "users"("id");

ALTER TABLE "bank_accounts" ADD CONSTRAINT "bank_accounts_fk2" FOREIGN KEY ("health_indicator_id") REFERENCES "health_indicator"("id");



ALTER TABLE "events" ADD CONSTRAINT "events_fk1" FOREIGN KEY ("account_id") REFERENCES "bank_accounts"("id");

ALTER TABLE "events" ADD CONSTRAINT "events_fk2" FOREIGN KEY ("method_id") REFERENCES "methods"("id");

ALTER TABLE "events" ADD CONSTRAINT "events_fk3" FOREIGN KEY ("transaction_type_id") REFERENCES "transaction_types"("id");

ALTER TABLE "events" ADD CONSTRAINT "events_fk4" FOREIGN KEY ("recurrence_type_id") REFERENCES "recurrence_types"("id");
ALTER TABLE "recurrence_types" ADD CONSTRAINT "recurrence_types_fk1" FOREIGN KEY ("account_id") REFERENCES "bank_accounts"("id");

ALTER TABLE "wishlist" ADD CONSTRAINT "wishlist_fk1" FOREIGN KEY ("account_id") REFERENCES "bank_accounts"("id");

ALTER TABLE "wishlist" ADD CONSTRAINT "wishlist_fk2" FOREIGN KEY ("method_id") REFERENCES "methods"("id");

ALTER TABLE "wishlist" ADD CONSTRAINT "wishlist_fk3" FOREIGN KEY ("transaction_type_id") REFERENCES "transaction_types"("id");

ALTER TABLE "wishlist" ADD CONSTRAINT "wishlist_fk4" FOREIGN KEY ("recurrence_type_id") REFERENCES "recurrence_types"("id");