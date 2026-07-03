from opensearch_client import get_client
from event_generator import create_event
import time

client = get_client()

while True:

    event = create_event()

    response = client.index(
        index="logs",
        body=event,
        refresh=True
    )

    print(f"Indexed {response['_id']}")

    time.sleep(2)