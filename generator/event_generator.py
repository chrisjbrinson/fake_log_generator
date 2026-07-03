from datetime import datetime, timezone
import random

from simulators.ucmdb import create_ucmdb_event
from simulators.axonius import create_axonius_event


def create_event():

    roll = random.random()

    if roll < 0.50:
        event = create_ucmdb_event()
    else:
        event = create_axonius_event()

    event["@timestamp"] = datetime.now(timezone.utc).isoformat()

    return event