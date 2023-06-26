CREATE DATABASE persons;

\c persons;

CREATE TABLE "persons" (
  "id" int PRIMARY KEY,
  "description" varchar(2) NOT NULL
);

CREATE TABLE "persons_documents" (
  "document_id" char(2) NOT NULL,
  "person_id" int NOT NULL,
  "value" varchar(20) NOT NULL,
  PRIMARY KEY ("document_id"),
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
