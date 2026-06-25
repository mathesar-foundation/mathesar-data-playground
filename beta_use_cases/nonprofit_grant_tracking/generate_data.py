import os
import random
from datetime import datetime
from faker import Faker

fake = Faker()

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
NUM_GRANTS = 20
NUM_STAFF = 15
NUM_LIFECYCLE_STAGES = 6
NUM_GRANT_LIFECYCLE_ENTRIES = 50
NUM_ALLOCATIONS = 40

LIFECYCLE_STAGES = [
    "Application Submitted",
    "Review Process",
    "Approved",
    "Fund Disbursed",
    "Implementation",
    "Final Report",
]

# Table Data Generation
def generate_grants():
    stock_phrases = [
        "Literacy Program",
        "Time to Read",
        "Building Readers",
        "Read and Succeed",
        "Community Reading Initiative",
    ]
    for i in range(1, NUM_GRANTS + 1):
        name = f"{fake.city()} {random.choice(stock_phrases)}"
        yield [
            i,
            name,
            fake.paragraph(),
            round(random.uniform(1000, 50000), 2),
            fake.date_this_decade(),
            fake.date_this_decade(),
        ]

def generate_staff():
    for i in range(1, NUM_STAFF + 1):
        yield [
            i,
            fake.name(),
            random.choice(["Program Manager", "Coordinator", "Administrator", "Finance Officer"]),
        ]

def generate_lifecycle_stages():
    for i, stage in enumerate(LIFECYCLE_STAGES, start=1):
        yield [i, stage, fake.paragraph()]

def generate_grant_lifecycle():
    lifecycle_entries = set()
    for i in range(1, NUM_GRANT_LIFECYCLE_ENTRIES + 1):
        grant_id = random.randint(1, NUM_GRANTS)
        stage_id = random.randint(1, NUM_LIFECYCLE_STAGES)
        staff_id = random.randint(1, NUM_STAFF)
        if (grant_id, stage_id) not in lifecycle_entries:
            lifecycle_entries.add((grant_id, stage_id))
            yield [
                i,
                grant_id,
                stage_id,
                staff_id,
                fake.date_time_this_year(),
            ]


def generate_allocations():
    for i in range(1, NUM_ALLOCATIONS + 1):
        yield [
            i,
            random.randint(1, NUM_GRANTS),
            round(random.uniform(500, 5000), 2),  # Allocated amount
            round(random.uniform(0, 5000), 2),   # Spent amount
        ]

# Main Script
if __name__ == "__main__":
    tables = {
        "Grants": generate_grants(),
        "Staff": generate_staff(),
        "Lifecycle Stages": generate_lifecycle_stages(),
        "Grant Lifecycle": generate_grant_lifecycle(),
        "Grant Allocations": generate_allocations(),
    }

    sql_file = get_output_file_path("generated_data.sql")
    write_to_sql_file(sql_file, "Nonprofit Grant Tracking", tables)
