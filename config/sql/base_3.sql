CREATE DATABASE persons;

\c persons;
CREATE TABLE "persons" (
  "id" int PRIMARY KEY,
  "name" varchar(50) NOT NULL
);

CREATE TABLE "addresses" (
  "id" int PRIMARY KEY,
  "person_id" int,
  "address_line" varchar(100) NOT NULL,
  "city" varchar(50) NOT NULL,
  "state" varchar(50) NOT NULL,
  "country" varchar(50) NOT NULL,
  FOREIGN KEY ("person_id") REFERENCES "persons" ("id")
);

CREATE TABLE "persons_documents" (
  "id" int PRIMARY KEY,
  "person_id" int,
  "document_id" int,
  "value" varchar(20) NOT NULL,
  FOREIGN KEY ("person_id") REFERENCES "persons" ("id"),
  FOREIGN KEY ("document_id") REFERENCES "documents" ("id")
);

CREATE TABLE "document_types" (
  "id" int PRIMARY KEY,
  "name" varchar(50) NOT NULL
);

CREATE TABLE "documents" (
  "id" int PRIMARY KEY,
  "description" varchar(50) NOT NULL,
  "value" varchar(50) NOT NULL,
  "document_type_id" int,
  FOREIGN KEY ("document_type_id") REFERENCES "document_types" ("id")
);

CREATE TABLE "persons_types" (
  "id" int PRIMARY KEY,
  "type" varchar(50) NOT NULL
);

CREATE TABLE "persons_type_association" (
  "person_id" int,
  "type_id" int,
  FOREIGN KEY ("person_id") REFERENCES "persons" ("id"),
  FOREIGN KEY ("type_id") REFERENCES "persons_types" ("id"),
  PRIMARY KEY ("person_id", "type_id")
);
