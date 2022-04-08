import sys
import json
import os
from jinja2 import Environment, FileSystemLoader, select_autoescape

def generate_ansible_inventory(linode):
    env = Environment(
        loader=FileSystemLoader("templates"),
        autoescape=select_autoescape()
    )
    template = env.get_template("hosts.j2")
    print("Generating inventory file".center(80, "-"))
    return template.render(linode=linode)

with open("servers.json") as f:
    data = json.load(f)

with open("ansible/hosts", "w") as f:
    f.write(generate_ansible_inventory(data))