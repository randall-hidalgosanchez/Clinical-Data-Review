# Clinical Data Review

A starter project for importing, cleaning, validating, and analyzing clinical
data, with a Shiny application structure for review workflows.

## Project layout

- `data/raw/` — source files; keep originals unchanged.
- `data/processed/` — derived datasets created by the analysis workflow.
- `R/` — reusable import, cleaning, validation, and analysis code.
- `sql/` — data quality and consistency checks.
- `app/` — Shiny user interface, server, modules, and static assets.
- `reports/` — generated reports.
- `tests/` — automated checks.

Do not commit identifiable or otherwise sensitive patient data. Keep data files
out of version control unless they are synthetic or explicitly approved for
sharing.

## Getting started

This repository is a scaffold; no dataset schema or clinical rules are assumed.
Document the expected input columns and validation rules before using it with
real data. Initialize and snapshot the project's R dependencies with `renv`
when dependencies are selected. For python/conda use: conda env export --from-history > python/environment.yml