import random


ADAPTERS = [
    "AWS EC2",
    "Azure VM",
    "Active Directory",
    "CrowdStrike",
    "Microsoft Defender",
    "Tenable",
    "ServiceNow"
]

ERRORS = [
    "API Rate Limit",
    "Authentication Failed",
    "Adapter Timeout",
    "Connection Refused",
    "Invalid Credentials"
]


def create_axonius_event():

    success = random.random() < 0.95

    if success:

        return {
            "application": "Axonius",
            "event_type": "adapter_sync",
            "adapter": random.choice(ADAPTERS),
            "status": "SUCCESS",
            "duration_ms": random.randint(2000, 15000),
            "devices_imported": random.randint(100, 2500),
            "severity": "INFO"
        }

    return {
        "application": "Axonius",
        "event_type": "adapter_sync",
        "adapter": random.choice(ADAPTERS),
        "status": "FAILED",
        "error": random.choice(ERRORS),
        "severity": "ERROR"
    }