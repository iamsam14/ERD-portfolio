BEGIN;


CREATE TABLE public.staff
(
    staff_id integer NOT NULL,
    first_name character varying(20),
    last_name character varying(30),
    start_date date NOT NULL,
    PRIMARY KEY (staff_id)
);

CREATE TABLE public.staff_details
(
    staff_id integer NOT NULL,
    "position" character varying(20) NOT NULL,
    location character varying(10)
);

CREATE TABLE public.sales_outlet
(
    sales_outlet_id "char" NOT NULL,
    manager_id "char" NOT NULL,
    PRIMARY KEY (sales_outlet_id)
);

CREATE TABLE public.sales_outlet_details
(
    sales_outlet_id integer NOT NULL,
    type character varying(15),
    address character varying(50),
    city character varying(30),
    telephone character varying(15),
    postal_code integer
);

CREATE TABLE public.sales_transaction
(
    sales_transaction_id integer NOT NULL,
    transaction_date date,
    transaction_time time without time zone,
    sales_outlet_id integer NOT NULL,
    staff_id integer NOT NULL,
    customer_id integer NOT NULL,
    PRIMARY KEY (sales_transaction_id)
);

CREATE TABLE public.sales_details
(
    transaction_id integer NOT NULL,
    product_id integer,
    quantity integer
);

CREATE TABLE public.customer
(
    customer_id integer NOT NULL,
    customer_email character varying(100) NOT NULL,
    customer_card_number character varying(15) NOT NULL,
    customer_since date NOT NULL,
    PRIMARY KEY (customer_id)
);

CREATE TABLE public.customer_details
(
    customer_id integer,
    customer_name character varying(60),
    birthdate date,
    gender character varying(2)
);

CREATE TABLE public.product
(
    product_id integer NOT NULL,
    price numeric NOT NULL,
    PRIMARY KEY (product_id)
);

CREATE TABLE public.product_type
(
    product_id integer,
    product_category character varying(20),
    product_type character varying(30),
    description character varying(200)
);

ALTER TABLE public.sales_details
    ADD FOREIGN KEY (product_id)
    REFERENCES public.product (product_id)
    NOT VALID;


ALTER TABLE public.product
    ADD FOREIGN KEY (product_id)
    REFERENCES public.product_type (product_id)
    NOT VALID;


ALTER TABLE public.staff
    ADD FOREIGN KEY (staff_id)
    REFERENCES public.staff_details (staff_id)
    NOT VALID;


ALTER TABLE public.sales_outlet
    ADD FOREIGN KEY (manager_id)
    REFERENCES public.staff (staff_id)
    NOT VALID;


ALTER TABLE public.sales_transaction
    ADD FOREIGN KEY (customer_id)
    REFERENCES public.customer (customer_id)
    NOT VALID;


ALTER TABLE public.sales_transaction
    ADD FOREIGN KEY (sales_outlet_id)
    REFERENCES public.sales_outlet (sales_outlet_id)
    NOT VALID;


ALTER TABLE public.customer_details
    ADD FOREIGN KEY (customer_id)
    REFERENCES public.customer (customer_id)
    NOT VALID;


ALTER TABLE public.sales_details
    ADD FOREIGN KEY (transaction_id)
    REFERENCES public.sales_transaction (sales_transaction_id)
    NOT VALID;

END;
