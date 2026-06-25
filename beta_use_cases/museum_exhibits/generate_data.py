import os
import random
from datetime import datetime, timedelta
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
NUM_LOCATIONS = 5
NUM_COLLECTIONS = 10
NUM_ACQUISITION_TYPES = 5
NUM_EXHIBITS = 15
NUM_ITEMS = 50

# Base and descriptor model for items
BASE_ITEMS = {
    "artifact": ["region", "time_period", "material"],
    "manuscript": ["region", "time_period", "content_type"],
    "painting": ["art_style", "region", "texture"],
    "sketches": ["art_style", "region", "texture", "content_type"],
    "portrait series": ["art_style", "region", "texture"],
    "drawing": ["themes", "art_style", "region", "texture"],
    "sculpture": ["material", "art_style", "region"],
    "vase": ["material", "region", "art_style"],
    "pot": ["region", "art_style"],
    "bowl and plate": ["material", "region", "art_style"],
}

DESCRIPTORS = {
    "themes": ["bird", "landscape", "butterfly", "isolation", "urban landscapes", "the home"],
    "art_style": ["impressionist", "baroque", "abstract", "cubist", "modernist"],
    "content_type": ["religious", "philosophical", "scientific", "literary"],
    "material": ["marble", "bronze", "clay", "papyrus", "wood", "charcoal", "pen"],
    "region": ["greek", "roman", "egyptian", "asian", "medieval european"],
    "texture": ["smooth", "rough", "polished", "weathered"],
    "time_period": ["ancient", "medieval", "renaissance", "19th century", "20th century"],
}

COLLECTION_THEMES = [
    "decontextualizing",
    "reclaiming the",
    "liminal retreat in",
    "voices in",
    "silence: exploring",
    "perspectives on",
    "the evolution of",
]

# Helper function to generate item names
def generate_item_name():
    base_item = random.choice(list(BASE_ITEMS.keys()))
    allowed_descriptors = BASE_ITEMS[base_item]
    name_parts = [base_item]

    for category in allowed_descriptors:
        if random.random() < 0.7:  # 70% chance to include a descriptor
            descriptor = random.choice(DESCRIPTORS[category])
            name_parts.insert(0, descriptor)

    if random.random() < 0.5:  # 50% chance to include a theme
        theme = random.choice(DESCRIPTORS["themes"])
        name_parts.insert(0, theme)

    return " ".join(name_parts).capitalize()

def generate_locations():
    for i in range(1, NUM_LOCATIONS + 1):
        yield [i, f"Museum Location {i}", fake.address()]

def generate_collections():
    for i in range(1, NUM_COLLECTIONS + 1):
        art_style = random.choice(DESCRIPTORS["art_style"])
        time_period = random.choice(DESCRIPTORS["time_period"])
        name = f"{time_period} {art_style} Collection".title()
        yield [i, name, fake.text(max_nb_chars=50)]

def generate_acquisition_types():
    hardcoded_acquisition_types = ["Donation", "Purchase", "Bequest", "Loan", "Exchange"]
    for i, name in enumerate(hardcoded_acquisition_types, start=1):
        yield [i, name, fake.sentence()]

def generate_exhibits(location_ids):
    for i in range(1, NUM_EXHIBITS + 1):
        base_item = random.choice(list(BASE_ITEMS.keys()))
        exhibit_theme = random.choice(COLLECTION_THEMES)
        item_theme = random.choice(DESCRIPTORS["themes"])
        name = f"{exhibit_theme} {item_theme} {base_item}".title()
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
            fake.text(max_nb_chars=100),
        ]

def generate_items(acquisition_type_ids, collection_ids, exhibit_ids):
    for i in range(1, NUM_ITEMS + 1):
        name = generate_item_name()
        acquisition_date = fake.date_this_year()
        exhibit_id = random.choice(exhibit_ids) if random.random() < 0.5 else None
        yield [
            i,
            name,
            fake.unique.ean13(),
            acquisition_date,
            random.choice(acquisition_type_ids),
            exhibit_id,
        ]

def generate_item_collections(collection_ids, item_ids):
    """Generate relationships between items and multiple collections."""
    for item_id in item_ids:
        num_collections = random.randint(1, 3)  # Each item belongs to 1-3 collections
        assigned_collections = random.sample(collection_ids, num_collections)
        for collection_id in assigned_collections:
            yield [item_id, collection_id]

if __name__ == "__main__":
    # Generate IDs
    location_ids = list(range(1, NUM_LOCATIONS + 1))
    collection_ids = list(range(1, NUM_COLLECTIONS + 1))
    acquisition_type_ids = list(range(1, NUM_ACQUISITION_TYPES + 1))
    exhibit_ids = list(range(1, NUM_EXHIBITS + 1))
    item_ids = list(range(1, NUM_ITEMS + 1))

    # Generate tables
    tables = {
        "Locations": generate_locations(),
        "Collections": generate_collections(),
        "Acquisition Types": generate_acquisition_types(),
        "Exhibits": generate_exhibits(location_ids),
        "Items": generate_items(acquisition_type_ids, collection_ids, exhibit_ids),  # Generate Items first
    }

    # Generate Item_Collections after Items
    tables["Item_Collections"] = generate_item_collections(collection_ids, item_ids)

    # Write to SQL file
    sql_file = get_output_file_path("generated_data.sql")
    write_to_sql_file(sql_file, "Museum Exhibits", tables)
