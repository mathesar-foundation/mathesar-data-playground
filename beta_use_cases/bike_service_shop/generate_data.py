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
NUM_CUSTOMERS = 20
NUM_MECHANICS = 5
NUM_EQUIPMENT_TYPES = 8
NUM_EQUIPMENT = 50
NUM_SERVICE_REQUESTS = 30
NUM_SERVICE_MILESTONES = 100

EQUIPMENT_TYPES = [
    "Mountain Bike",
    "Road Bike",
    "Hybrid Bike",
    "Electric Bike",
    "BMX Bike",
    "Cyclocross Bike",
    "Folding Bike",
    "Touring Bike"
]

PARTS_AND_NOTES = {
    "Frame": [
        "Small dent on the top tube identified during inspection.",
        "Frame cleaned and polished; customer commented on how shiny it looked.",
        "Noticed a crack near the bottom bracket; recommended a replacement.",
    ],
    "Wheels": [
        "Bent rear rim; trued the wheel successfully.",
        "Replaced a broken spoke on the front wheel.",
        "Customer pleased with how smooth the wheels now spin.",
    ],
    "Tires": [
        "Replaced a worn-out rear tire; customer opted for puncture-resistant model.",
        "Front tire inflated; slow leak detected and patched.",
        "Customer appreciated advice on tire pressure for road biking.",
    ],
    "Brakes": [
        "Adjusted brake pads for better stopping power.",
        "Rear brake cable frayed; replaced with a new one.",
        "Customer remarked how responsive the brakes feel now.",
    ],
    "Gears": [
        "Shifted gears sticking; replaced derailleur hanger.",
        "Customer reported skipping gears; adjusted indexing.",
        "Lubricated drivetrain; customer noticed quieter pedaling.",
    ],
    "Handlebars": [
        "Re-wrapped handlebar tape; customer loved the color choice.",
        "Handlebar alignment corrected; was slightly off-center.",
        "Installed new ergonomic grips; customer was excited about the comfort.",
    ],
    "Pedals": [
        "Left pedal bearings replaced due to grinding noise.",
        "Upgraded pedals to a clipless system; customer very happy.",
        "Mechanic noticed loose threads on right pedal spindle; tightened securely.",
    ],
    "Seat": [
        "Seatpost adjusted for proper height; customer reported better comfort.",
        "Replaced torn saddle with a new gel-padded seat.",
        "Customer commented that the saddle now feels like new.",
    ],
}

REQUEST_DESCRIPTIONS = [
    "Bike makes a clicking noise while pedaling.",
    "Brakes feel soft and don't stop effectively.",
    "Gears are not shifting smoothly.",
    "Rear wheel wobbles; possible rim issue.",
    "Flat tire; needs replacement or repair.",
    "Customer wants a full tune-up before a race.",
    "Looking to upgrade to tubeless tires.",
    "Front fork feels stiff; possible suspension issue.",
    "Customer complained about an uncomfortable saddle.",
    "Handlebars feel loose and need adjustment.",
    "Chain keeps falling off during rides.",
    "Rear derailleur seems bent after a crash.",
    "Customer wants clipless pedals installed.",
    "Headset creaks when turning the handlebars.",
    "Electric bike battery isn't holding charge.",
    "Customer wants help installing accessories (e.g., lights, rack).",
    "Bike feels heavy and sluggish; might need a drivetrain cleaning.",
    "Suspension setup needs adjusting for rider weight.",
    "Customer reported squeaky brakes after riding in wet conditions.",
    "Child seat needs to be installed securely on the frame.",
]

SERVICE_STATUSES = ["Received", "In Progress", "Awaiting Part", "Completed"]

def generate_customers():
    for i in range(1, NUM_CUSTOMERS + 1):
        yield [
            i,
            fake.first_name(),
            fake.last_name(),
            fake.email(),
            fake.phone_number()
        ]

def generate_equipment_types():
    for i, name in enumerate(EQUIPMENT_TYPES, start=1):
        yield [i, name]

def generate_mechanics():
    for i in range(1, NUM_MECHANICS + 1):
        yield [
            i,
            fake.first_name(),
            fake.last_name()
        ]

def generate_service_statuses():
    for i, name in enumerate(SERVICE_STATUSES, start=1):
        yield [i, name]

def generate_equipment(equipment_type_ids):
    for i in range(1, NUM_EQUIPMENT + 1):
        yield [
            i,
            random.choice(equipment_type_ids),  # Valid type_id
            fake.unique.ean13(), # serial number
            ""
        ]

def generate_service_requests(customer_ids, equipment_ids, mechanic_ids):
    for i in range(1, NUM_SERVICE_REQUESTS + 1):
        yield [
            i,
            random.choice(customer_ids),  # Valid customer_id
            random.choice(equipment_ids),  # Valid equipment_id
            random.choice(mechanic_ids),  # Valid mechanic_id
            random.choice(REQUEST_DESCRIPTIONS),  # Realistic request description
            round(random.uniform(20, 500), 2),
            fake.date_time_this_year(),
            fake.date_time_this_year() if random.random() < 0.5 else None
        ]

def generate_service_milestones(service_request_ids, status_ids):
    for i in range(1, NUM_SERVICE_MILESTONES + 1):
        part, notes = random.choice(list(PARTS_AND_NOTES.items()))
        yield [
            i,
            random.choice(service_request_ids),  # Valid service_request_id
            random.choice(status_ids),  # Valid status_id
            fake.date_time_this_year(),
            f"{part}: {random.choice(notes)}"  # Realistic service note
        ]

if __name__ == "__main__":
    # Generate valid IDs based on schema
    customer_ids = list(range(1, NUM_CUSTOMERS + 1))
    equipment_type_ids = list(range(1, NUM_EQUIPMENT_TYPES + 1))
    equipment_ids = list(range(1, NUM_EQUIPMENT + 1))
    mechanic_ids = list(range(1, NUM_MECHANICS + 1))
    service_request_ids = list(range(1, NUM_SERVICE_REQUESTS + 1))
    status_ids = list(range(1, len(SERVICE_STATUSES) + 1))

    # Generate tables
    equipment = list(generate_equipment(equipment_type_ids))
    service_requests = list(generate_service_requests(customer_ids, equipment_ids, mechanic_ids))
    service_milestones = list(generate_service_milestones(service_request_ids, status_ids))

    tables = {
        "Customers": generate_customers(),
        "Equipment Types": generate_equipment_types(),
        "Equipment": iter(equipment),  # Pre-generated equipment
        "Mechanics": generate_mechanics(),
        "Service Statuses": generate_service_statuses(),
        "Service Requests": iter(service_requests),  # Pre-generated service requests
        "Service Milestones": iter(service_milestones),  # Pre-generated milestones
    }

    sql_file = get_output_file_path("generated_data.sql")
    write_to_sql_file(sql_file, "Bike Shop", tables)
