DROP SCHEMA IF EXISTS "Hardware Store" CASCADE;
CREATE SCHEMA "Hardware Store";
SET search_path = "Hardware Store";

CREATE TABLE "Store Locations" (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name TEXT NOT NULL,
    address TEXT
);

CREATE TABLE "Customers" (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT UNIQUE,
    phone TEXT,
    address TEXT
);

CREATE TABLE "Assets" (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name TEXT NOT NULL,
    serial_number TEXT NOT NULL UNIQUE,
    rental_price NUMERIC(10, 2),  -- Standard rental price
    sale_price NUMERIC(10, 2),    -- Optional sale price
    rental_period TEXT,           -- Daily, Weekly, Monthly
    location TEXT,                -- Physical location in store
    store_id BIGINT NOT NULL REFERENCES "Store Locations"(id) ON DELETE SET NULL
);

CREATE INDEX idx_assets_store_id ON "Assets" (store_id);

CREATE TABLE "Transactions" (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    asset_id BIGINT NOT NULL REFERENCES "Assets"(id) ON DELETE CASCADE,
    customer_id BIGINT NOT NULL REFERENCES "Customers"(id) ON DELETE SET NULL,
    transaction_type TEXT CHECK (transaction_type IN ('Sale', 'Rental', 'Return')),
    transaction_date TIMESTAMP WITH TIME ZONE NOT NULL,
    total_charge NUMERIC(10, 2),  -- Sale price or rental charge
    note TEXT
);

CREATE INDEX idx_transactions_asset_id ON "Transactions" (asset_id);
CREATE INDEX idx_transactions_customer_id ON "Transactions" (customer_id);

CREATE TABLE "Rentals" (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    transaction_id BIGINT NOT NULL REFERENCES "Transactions"(id) ON DELETE CASCADE,
    rental_start TIMESTAMP WITH TIME ZONE,
    rental_end TIMESTAMP WITH TIME ZONE,
    time_out TIMESTAMP WITH TIME ZONE,
    time_in TIMESTAMP WITH TIME ZONE,
    rental_time INTERVAL
);

CREATE INDEX idx_rentals_transaction_id ON "Rentals" (transaction_id);
