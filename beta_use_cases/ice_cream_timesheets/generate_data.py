import os
import random
from datetime import datetime, timedelta
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
NUM_EMPLOYEES = 20
NUM_TIMESHEETS = 50
NUM_SCHEDULES = 40

ROLES = [
    "Warehouse Manager",
    "Delivery Driver",
    "Dispatcher",
    "Order Picker",
    "Forklift Operator",
    "Operations Manager",
    "Sales Representative",
    "Inventory Clerk",
    "Customer Service Rep",
    "Quality Assurance Specialist",
]

# Table Data Generation
def generate_employees():
    for i in range(1, NUM_EMPLOYEES + 1):
        yield [i, fake.name(), random.choice(ROLES), fake.unique.email()]

def generate_timesheets(employee_ids):
    for i in range(1, NUM_TIMESHEETS + 1):
        employee_id = random.choice(employee_ids)
        clock_in = fake.date_time_this_year()
        clock_out = clock_in + timedelta(hours=random.uniform(4, 8))
        hours_worked = round((clock_out - clock_in).total_seconds() / 3600, 2)
        schedule_date = clock_in.date()
        yield [i, employee_id, clock_in, clock_out, hours_worked, schedule_date]

def generate_schedules(employee_ids):
    for i in range(1, NUM_SCHEDULES + 1):
        employee_id = random.choice(employee_ids)
        start_time = fake.date_time_this_year()
        end_time = start_time + timedelta(hours=random.uniform(4, 8))
        business_needs = random.choice([
            "Restocking inventory",
            "Processing shipments",
            "Loading delivery trucks",
            "Quality control",
            "Training session",
        ])
        yield [i, employee_id, start_time, end_time, business_needs]

# Main Script
if __name__ == "__main__":
    employee_ids = list(range(1, NUM_EMPLOYEES + 1))

    tables = {
        "Employees": generate_employees(),
        "Timesheets": generate_timesheets(employee_ids),
        "Schedules": generate_schedules(employee_ids),
    }

    sql_file = get_output_file_path("generated_data.sql")
    write_to_sql_file(sql_file, "Ice Cream Employee Management", tables)
