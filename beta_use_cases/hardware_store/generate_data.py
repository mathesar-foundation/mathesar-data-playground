import os
import random
from datetime import timedelta, datetime
from faker import Faker

fake = Faker()

# Helper functions
def clean_value(value):
    """Clean a value for SQL COPY operations."""
    if value is None:
        return r"\N"
    if isinstance(value, str):
        return value.replace("\t", " ").replace("\n", " ")
    return str(value)

def write_to_sql_file(output_path, search_path, tables):
    """Write the generated data to an SQL file."""
    with open(output_path, "w") as f:
        f.write(f'SET search_path="{search_path}";\n\n')
        for table_name, generator in tables.items():
            f.write(f'COPY "{table_name}" FROM stdin;\n')
            for row in generator:
                cleaned_row = "\t".join(map(clean_value, row))
                f.write(f"{cleaned_row}\n")
            f.write("\\.\n\n")
    print(f"SQL file generated: {output_path}")

def get_output_file_path(filename):
    """Get the output file path relative to the current script's directory."""
    current_file_dir = os.path.dirname(os.path.abspath(__file__))
    return os.path.join(current_file_dir, filename)

# Constants
NUM_STORES = 5
NUM_CUSTOMERS = 20
NUM_ASSETS = 50
NUM_TRANSACTIONS = 60
NUM_RENTALS = 30

BASE_PRODUCTS = {
    "air compressor": ["size", "feature", "quality"],
    "chainsaw": ["size", "feature", "quality"],
    "drill": ["size", "feature", "quality"],
    "hammer": ["quality", "feature"],
    "hand axe": ["size", "quality"],
    "lawn mower": ["size", "feature", "quality"],
    "leaf blower": ["size", "feature"],
    "pliers set": ["size", "set_type"],
    "power saw": ["feature", "quality"],
    "screwdriver set": ["size", "feature", "set_type"],
    "shovel": ["size", "quality"],
    "socket set": ["size", "feature", "set_type"],
    "wheelbarrow": ["size", "quality"],
    "workbench": ["size", "feature", "quality"],
    "wrench set": ["size", "set_type", "quality"],
}

DESCRIPTORS = {
    "feature": ["adjustable", "collapsible", "ergonomic", "cordless", "heavy-duty"],
    "quality": ["deluxe", "professional", "basic", "lightweight", "industrial"],
    "set_type": ["10pc", "20pc", "5pc", "15pc"],
    "size": ["xl", "sm", "compact", "oversized", "portable"],
}

# Helper function to generate asset names
def generate_asset_name():
    base_product = random.choice(list(BASE_PRODUCTS.keys()))
    allowed_descriptors = BASE_PRODUCTS[base_product]
    name_parts = [base_product]

    for category in allowed_descriptors:
        if random.random() < 0.7:  # 70% chance to include a descriptor from this category
            descriptor = random.choice(DESCRIPTORS[category])
            name_parts.insert(0, descriptor)  # Add descriptor before the base product name

    return " ".join(name_parts).title()

# Table Data Generation
def generate_store_locations():
    for i in range(1, NUM_STORES + 1):
        yield [i, fake.company(), fake.address()]

def generate_customers():
    for i in range(1, NUM_CUSTOMERS + 1):
        yield [
            i,
            fake.first_name(),
            fake.last_name(),
            fake.email(),
            fake.phone_number(),
            fake.address(),
        ]

def generate_assets(store_ids):
    for i in range(1, NUM_ASSETS + 1):
        rental_period = random.choice(["daily", "weekly", "monthly"])
        rental_price = round(random.uniform(5, 100), 2)
        sale_price = (
            round(rental_price * random.uniform(0.5, 0.8), 2)  # Discounted sale price
            if random.random() < 0.2 else None
        )
        yield [
            i,
            generate_asset_name(),
            fake.unique.ean13(),
            rental_price,
            sale_price,
            rental_period,
            f"Aisle {random.randint(1, 20)} - Shelf {random.randint(1, 10)}",
            random.choice(store_ids),
        ]

def generate_transactions(asset_ids, customer_ids):
    for i in range(1, NUM_TRANSACTIONS + 1):
        asset_id = random.choice(asset_ids)
        customer_id = random.choice(customer_ids)
        transaction_type = random.choice(["Sale", "Rental", "Return"])
        transaction_date = fake.date_time_this_year()
        total_charge = round(random.uniform(10, 500), 2)
        yield [i, asset_id, customer_id, transaction_type, transaction_date, total_charge, fake.sentence()]

def generate_rentals(transaction_ids):
    for i in range(1, NUM_RENTALS + 1):
        transaction_id = random.choice(transaction_ids)
        rental_start = fake.date_time_this_year()
        rental_end = fake.date_time_between_dates(datetime_start=rental_start)
        rental_time = rental_end - rental_start
        yield [i, transaction_id, rental_start, rental_end, rental_start, rental_end, rental_time]

# Main Script
if __name__ == "__main__":
    store_ids = list(range(1, NUM_STORES + 1))
    customer_ids = list(range(1, NUM_CUSTOMERS + 1))
    asset_ids = list(range(1, NUM_ASSETS + 1))
    transaction_ids = list(range(1, NUM_TRANSACTIONS + 1))

    tables = {
        "Store Locations": generate_store_locations(),
        "Customers": generate_customers(),
        "Assets": generate_assets(store_ids),
        "Transactions": generate_transactions(asset_ids, customer_ids),
        "Rentals": generate_rentals(transaction_ids),
    }

    sql_file = get_output_file_path("generated_data.sql")
    write_to_sql_file(sql_file, "Hardware Store", tables)
