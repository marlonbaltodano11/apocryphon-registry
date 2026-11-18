# Patrones pytest

```python
import pytest
from app.pricing import total

@pytest.mark.parametrize(("lines", "expected"), [
    ([10, 5], 15),
    ([], 0),
])
def test_total(lines, expected):
    assert total(lines) == expected
```

```python
def test_config_rejects_missing_secret(monkeypatch):
    monkeypatch.delenv("API_KEY", raising=False)
    with pytest.raises(ValueError):
        load_settings()
```
