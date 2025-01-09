import os
import random
from faker import Faker
from datetime import datetime, timedelta

fake = Faker()

# Number of rows to generate
NUM_LOCATIONS = 5
NUM_COLLECTIONS = 10
NUM_ACQUISITION_TYPES = 5
NUM_EXHIBITS = 15
NUM_ITEMS = 50

# Helper function to clean values for COPY
def clean_value(value):
    if value is None:
        return r"\N"
    if isinstance(value, str):
        return value.replace("\t", " ").replace("\n", " ")
    return str(value)

adjectives = ["Ancient", "Modern", "Historic", "Rare", "Exquisite"]
nouns = ["Art", "Relics", "Artifacts", "Paintings", "Manuscripts", "Sculptures", "Vases", "Bowls"]

# Table Data Generation
def generate_locations():
    for i in range(1, NUM_LOCATIONS + 1):
        yield [i, f"Museum Location {i}", fake.address()]

def generate_collections():
    for i in range(1, NUM_COLLECTIONS + 1):
        name = f"{random.choice(adjectives)} {random.choice(nouns)} Collection"
        yield [i, name, fake.text(max_nb_chars=50)]

def generate_acquisition_types():
    hardcoded_acquisition_types = ["Donation", "Purchase", "Bequest", "Loan", "Exchange"]
    for i, name in enumerate(hardcoded_acquisition_types, start=1):
        yield [i, name, fake.sentence()]

def generate_exhibits(location_ids):
    for i in range(1, NUM_EXHIBITS + 1):
        name = f"{random.choice(adjectives)} {random.choice(nouns)} Exhibit"
        start_date = fake.date_this_year()
        end_date = (
            fake.date_between_dates(date_start=start_date, date_end=datetime.today() + timedelta(days=180))
            if random.random() < 0.7 else None
        )
        yield [
            i,
            name,
            start_date,
            end_date,
            random.choice(location_ids),
            random.choice([True, False]),
            fake.text(max_nb_chars=100)
        ]

def generate_items(acquisition_type_ids, collection_ids, exhibit_ids):
    for i in range(1, NUM_ITEMS + 1):
        name = f"{random.choice(adjectives)} {random.choice(nouns)}"
        acquisition_date = fake.date_this_year()
        exhibit_id = random.choice(exhibit_ids) if random.random() < 0.5 else None
        yield [
            i,
            name,
            fake.unique.ean13(),
            acquisition_date,
            random.choice(acquisition_type_ids),
            random.choice(collection_ids),
            exhibit_id
        ]

# Generate Data
location_ids = list(range(1, NUM_LOCATIONS + 1))
collection_ids = list(range(1, NUM_COLLECTIONS + 1))
acquisition_type_ids = list(range(1, NUM_ACQUISITION_TYPES + 1))
exhibit_ids = list(range(1, NUM_EXHIBITS + 1))

tables = {
    "Locations": generate_locations(),
    "Collections": generate_collections(),
    "Acquisition Types": generate_acquisition_types(),
    "Exhibits": generate_exhibits(location_ids),
    "Items": generate_items(acquisition_type_ids, collection_ids, exhibit_ids),
}

# Write to SQL file
sql_file = os.path.join(os.getcwd(), "generated_data.sql")

with open(sql_file, "w") as f:
    f.write('SET search_path="Museum Exhibits";\n\n')

    for table_name, generator in tables.items():
        # Add quotes around table name since it contains spaces
        f.write(f'COPY "{table_name}" FROM stdin;\n')
        for row in generator:
            cleaned_row = "\t".join(map(clean_value, row))
            f.write(f"{cleaned_row}\n")
        f.write("\\.\n\n")

print(f"SQL file generated: {sql_file}")
