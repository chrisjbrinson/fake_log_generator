import random


JOBS = [
    "AWS Inventory Discovery",
    "Azure Inventory Discovery",
    "Host Resources by Shell",
    "DNS Discovery",
    "SNMP Network Discovery"
]

PROBES = [
    "Probe-01",
    "Probe-02",
    "Probe-03",
    "Probe-04",
    "Probe-05"
]

ERRORS = [
    "SSH Authentication Failed",
    "AWS API Rate Limit",
    "DNS Timeout",
    "Credential Missing",
    "SNMP Timeout"
]


def create_ucmdb_event():

    success = random.random() < 0.90

    if success:

        return {
            "application": "UCMDB",
            "event_type": "discovery_job",
            "job": random.choice(JOBS),
            "probe": random.choice(PROBES),
            "status": "SUCCESS",
            "duration_ms": random.randint(3000, 45000),
            "nodes_discovered": random.randint(25, 400),
            "severity": "INFO"
        }

    return {
        "application": "UCMDB",
        "event_type": "discovery_job",
        "job": random.choice(JOBS),
        "probe": random.choice(PROBES),
        "status": "FAILED",
        "error": random.choice(ERRORS),
        "severity": "ERROR"
    }