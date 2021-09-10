CREATE TABLE "Movie" (
	"id" serial NOT NULL,
	"title" varchar(255) NOT NULL,
	"rating" varchar(255) NOT NULL,
	"length" integer NOT NULL,
	CONSTRAINT "Movie_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

INSERT INTO "Movie"(id, title, rating, length)
VALUES(100, 'Remote Control', 'PG-13', 124),
	  (200, 'Grease', 'R', 95);

CREATE TABLE "Ticket" (
	"id" serial NOT NULL,
	"price" serial NOT NULL,
	"customer_id" integer NOT NULL,
	"movie_id" integer NOT NULL,
	CONSTRAINT "Ticket_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

INSERT INTO "Ticket"(id, price, customer_id, movie_id)
VALUES(10, 8.50, 001, 100),
	  (20, 8.00, 001, 200);


CREATE TABLE "Concession" (
	"id" serial NOT NULL,
	"item" varchar(255) NOT NULL,
	"price" float4 NOT NULL,
	"quantity" integer NOT NULL,
	"customer_id" integer NOT NULL,
	CONSTRAINT "Concession_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

INSERT INTO "Concession"(id, item, price, quantity, customer_id)
VALUES(1, 'popcorn', 5.00, 1, 001);

INSERT INTO "Concession"(id, item, price, quantity, customer_id)
VALUES(3, 'soda', 3.00, 1, 001),
	  (4, 'gummy bears', 2.00, 1, 001),
	  (5, 'soft pretzel', 4.50, 1, 001);


CREATE TABLE "Customer" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	"phone_number" numeric NOT NULL,
	CONSTRAINT "Customer_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

INSERT INTO "Customer" (id, name, phone_number)
VALUES(001, 'Tammie Hall', 216-555-5555);



ALTER TABLE "Ticket" ADD CONSTRAINT "Ticket_fk0" FOREIGN KEY ("customer_id") REFERENCES "Customer"("id");
ALTER TABLE "Ticket" ADD CONSTRAINT "Ticket_fk1" FOREIGN KEY ("movie_id") REFERENCES "Movie"("id");

ALTER TABLE "Concession" ADD CONSTRAINT "Concession_fk0" FOREIGN KEY ("customer_id") REFERENCES "Customer"("id");
