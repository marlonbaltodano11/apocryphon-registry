# pyproject mínimo

```toml
[project]
name = "mi-servicio"
version = "0.1.0"
requires-python = ">=3.12"
dependencies = ["pydantic-settings>=2", "structlog>=24"]

[dependency-groups]
dev = ["pytest>=8", "pytest-cov>=5", "ruff>=0.6", "mypy>=1.11"]

[tool.ruff]
line-length = 100
target-version = "py312"

[tool.mypy]
strict = true

[tool.pytest.ini_options]
testpaths = ["tests"]
addopts = "-q --strict-markers"
```
