#!/usr/bin/env python3

import json
import yaml
import os
import csv
import io

SOURCE_DATA_PATH = "source_data"
CONTACTS_PATH = os.path.join(SOURCE_DATA_PATH, "contacts.json")
INTERACTIONS_PATH = os.path.join(SOURCE_DATA_PATH, "interactions")
TEMPLATE_PATH = os.path.join(SOURCE_DATA_PATH, "template.sql")
OUTPUT_PATH = "generated_data.sql"


def read_file(file):
    with open(file, "r") as f:
        return f.read()


def parse_markdown(content):
    if not content.startswith("---"):
        return {"frontmatter": {}, "content": content}
    _, frontmatter, content = content.split("---", 2)
    return {"frontmatter": yaml.safe_load(frontmatter), "content": content.strip()}


def clean_cell(cell):
    if cell is None:
        return r"\N"
    if isinstance(cell, str):
        return cell.replace("\n", r"\n")
    return cell


def tsv(rows):
    csv_data = io.StringIO()
    writer = csv.writer(csv_data, delimiter="\t", lineterminator="\n")
    cleaned_rows = [[clean_cell(cell) for cell in row] for row in rows]
    writer.writerows(cleaned_rows)
    return csv_data.getvalue().strip()


contacts = json.loads(read_file(CONTACTS_PATH))
website_types = {w["type"] for c in contacts for w in c["websites"]}
website_ids = {type: id for id, type in enumerate(website_types, start=1)}
tags = {t for c in contacts for t in c["tags"]}
tag_ids = {tag: id for id, tag in enumerate(tags, start=1)}


def get_contact_rows():
    for contact in contacts:
        yield [
            contact["id"],
            contact["full_name"],
            contact["informal_name"],
            contact["notes"],
        ]


def get_email_rows():
    id = 0
    for contact in contacts:
        is_primary = True
        for email in contact["emails"]:
            id += 1
            yield [id, contact["id"], email["address"], is_primary, email["source"]]
            is_primary = False


def get_website_type_rows():
    for type, id in website_ids.items():
        yield [id, type]


def get_website_rows():
    id = 0
    for contact in contacts:
        for website in contact["websites"]:
            id += 1
            type_id = website_ids[website["type"]]
            yield [id, contact["id"], website["url"], type_id]


def get_interaction_rows():
    for id, filename in enumerate(os.listdir(INTERACTIONS_PATH), start=1):
        if not filename.endswith(".md"):
            continue
        path = os.path.join(INTERACTIONS_PATH, filename)
        interaction = parse_markdown(read_file(path))
        yield [
            id,
            interaction["frontmatter"]["contact"],
            interaction["frontmatter"]["date"],
            interaction["frontmatter"]["subject"],
            interaction["content"],
        ]


def get_tag_rows():
    for tag, id in tag_ids.items():
        yield [id, tag]


def get_contact_tag_rows():
    id = 0
    for contact in contacts:
        for tag in contact["tags"]:
            id += 1
            yield [id, contact["id"], tag_ids[tag]]


sql = (
    read_file(TEMPLATE_PATH)
    .replace("__CONTACT_TSV_DATA__", tsv(get_contact_rows()))
    .replace("__EMAIL_TSV_DATA__", tsv(get_email_rows()))
    .replace("__WEBSITE_TYPE_TSV_DATA__", tsv(get_website_type_rows()))
    .replace("__WEBSITE_TSV_DATA__", tsv(get_website_rows()))
    .replace("__INTERACTION_TSV_DATA__", tsv(get_interaction_rows()))
    .replace("__TAG_TSV_DATA__", tsv(get_tag_rows()))
    .replace("__CONTACT_TAG_TSV_DATA__", tsv(get_contact_tag_rows()))
)


with open(OUTPUT_PATH, "w") as f:
    f.write(sql)
