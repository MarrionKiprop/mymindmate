from datetime import datetime, timedelta
from zoneinfo import ZoneInfo

TZ = "Africa/Nairobi"

def now_iso() -> str:
    return datetime.now(ZoneInfo(TZ)).isoformat(timespec="seconds")

def within_last_24h(ts: str) -> bool:
    """
    ts: ISO timestamp string
    """
    try:
        t = datetime.fromisoformat(ts)
        return t >= datetime.now(ZoneInfo(TZ)) - timedelta(hours=24)
    except Exception:
        return False
