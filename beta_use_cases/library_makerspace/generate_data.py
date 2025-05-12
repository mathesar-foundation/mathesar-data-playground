import os
import random
from datetime import datetime
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
NUM_PATRONS = 20
NUM_EQUIPMENT_TYPES = 7
NUM_EQUIPMENT = 30
NUM_JOBS = 50
NUM_TRAINING_RECORDS = 40
NUM_JOB_STATUSES = 5
NUM_EQUIPMENT_STATUSES = 4

EQUIPMENT_TYPES = [
    "Sewing Machine",
    "Laser Cutter",
    "Vinyl Cutter",
    "Sublimation Printer",
    "3D Printer",
]

BRANDS = {
    "Sewing Machine": ["Brother", "Singer", "Janome"],
    "Laser Cutter": ["Epilog", "Glowforge", "Trotec"],
    "Vinyl Cutter": ["Silhouette", "Cricut"],
    "Sublimation Printer": ["Sawgrass", "Epson", "Canon"],
    "3D Printer": ["Creality", "Prusa", "MakerBot"],
}

LOCATIONS = [
    "Main Library",
    "Mount Pleasant",
    "Rochambeau",
    "Knight Memorial",
]

JOB_STATUSES = ["Pending", "In Progress", "Completed", "Cancelled", "On Hold", "See Desk"]
EQUIPMENT_STATUSES = ["Available", "In Use", "Out of Order", "Under Maintenance", "On Loan"]

def generate_patrons():
    for i in range(1, NUM_PATRONS + 1):
        yield [i, fake.name(), fake.unique.email()]

def generate_equipment_types():
    for i, name in enumerate(EQUIPMENT_TYPES, start=1):
        yield [i, name]

def generate_equipment():
    for i in range(1, NUM_EQUIPMENT + 1):
        equipment_type = random.choice(EQUIPMENT_TYPES)
        brand = random.choice(BRANDS[equipment_type])
        model = f"{fake.random_uppercase_letter()}{random.randint(100, 999)}"
        yield [
            i,
            f"{brand} {equipment_type} {model}",  # Equipment name
            random.choice(LOCATIONS),  # Location
            random.randint(1, NUM_EQUIPMENT_STATUSES),  # Status ID
            EQUIPMENT_TYPES.index(equipment_type) + 1,  # Type ID (1-based index)
        ]

def generate_training_records():
    trained_pairs = set()
    for _ in range(NUM_TRAINING_RECORDS):
        patron_id = random.randint(1, NUM_PATRONS)
        equipment_id = random.randint(1, NUM_EQUIPMENT)
        if (patron_id, equipment_id) not in trained_pairs:
            trained_pairs.add((patron_id, equipment_id))
            yield [len(trained_pairs), patron_id, equipment_id, fake.date_time_this_year()]

def generate_jobs(training_records):
    for i in range(1, NUM_JOBS + 1):
        # Randomly select a valid training record
        _, patron_id, equipment_id, _ = random.choice(training_records)
        yield [
            i,
            equipment_id,
            patron_id,
            random.randint(1, NUM_JOB_STATUSES),
            i,  # queue_order
            fake.date_time_this_year(),
            fake.date_time_this_year() if random.random() < 0.7 else None,
            fake.date_time_this_year() if random.random() < 0.5 else None,
        ]

def generate_statuses(status_list):
    for i, name in enumerate(status_list, start=1):
        yield [i, name]

if __name__ == "__main__":
    # Pre-generate training records
    training_records = list(generate_training_records())

    tables = {
        "Equipment Statuses": generate_statuses(EQUIPMENT_STATUSES),
        "Job Statuses": generate_statuses(JOB_STATUSES),
        "Equipment Types": generate_equipment_types(),
        "Equipment": generate_equipment(),
        "Patrons": generate_patrons(),
        "Equipment Training": iter(training_records),
        "Jobs": generate_jobs(training_records),
    }

    sql_file = get_output_file_path("generated_data.sql")
    write_to_sql_file(sql_file, "Library Makerspace", tables)
