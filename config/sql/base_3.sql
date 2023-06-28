
CREATE TABLE posts
(
    "id" int PRIMARY KEY,
    title character varying COLLATE pg_catalog."default" NOT NULL,
    content character varying COLLATE pg_catalog."default" NOT NULL
);


CREATE TABLE IF NOT EXISTS "persons" (
  "id" int PRIMARY KEY,
  "name" varchar(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS "persons_roles" (
  "id" int PRIMARY KEY,
  "role_name" varchar(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS "person_roles_association" (
  "person_id" int,
  "role_id" int,
  FOREIGN KEY ("person_id") REFERENCES "persons" ("id"),
  FOREIGN KEY ("role_id") REFERENCES "persons_roles" ("id"),
  PRIMARY KEY ("person_id", "role_id")
);

CREATE TABLE IF NOT EXISTS "persons_documents" (
  "id" int PRIMARY KEY,
  "person_id" int,
  "document_id" int,
  "value" varchar(20) NOT NULL,
  FOREIGN KEY ("person_id") REFERENCES "persons" ("id"),
  FOREIGN KEY ("document_id") REFERENCES "persons_documents" ("id")
);

CREATE TABLE IF NOT EXISTS "document_types" (
  "id" int PRIMARY KEY,
  "name" varchar(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS "documents" (
  "id" int PRIMARY KEY,
  "description" varchar(50) NOT NULL,
  "value" varchar(50) NOT NULL,
  "document_type_id" int,
  FOREIGN KEY ("document_type_id") REFERENCES "document_types" ("id")
);

CREATE TABLE IF NOT EXISTS "persons_types" (
  "id" int PRIMARY KEY,
  "type" varchar(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS "persons_type_association" (
  "person_id" int,
  "type_id" int,
  FOREIGN KEY ("person_id") REFERENCES "persons" ("id"),
  FOREIGN KEY ("type_id") REFERENCES "persons_types" ("id"),
  PRIMARY KEY ("person_id", "type_id")
);

CREATE TABLE IF NOT EXISTS "address_types" (
  "id" int PRIMARY KEY,
  "type" varchar(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS "addresses" (
  "id" int PRIMARY KEY,
  "person_id" int,
  "address_line" varchar(100) NOT NULL,
  "city" varchar(50) NOT NULL,
  "state" varchar(50) NOT NULL,
  "country" varchar(50) NOT NULL,
  FOREIGN KEY ("person_id") REFERENCES "persons" ("id")
);

CREATE TABLE IF NOT EXISTS "address_type_association" (
  "address_id" int,
  "type_address_id" int,
  FOREIGN KEY ("address_id") REFERENCES "addresses" ("id"),
  FOREIGN KEY ("type_address_id") REFERENCES "address_types" ("id"),
  PRIMARY KEY ("address_id", "type_address_id")
);
