# Clinical Data Review

A starter project for exploring a Shiny application that supports clinical data
management review. The goal is to help reviewers find, understand, and track
potential data issues—not to perform statistical analysis.

## Intended workflow

- Import clinical datasets and preserve the source records.
- Run configurable checks for missing, invalid, or inconsistent values.
- Present flagged records with enough context for a reviewer to assess them.
- Track review outcomes and comments so potential issues can be followed up.

Findings are prompts for review, not automatic conclusions that a record is
incorrect. Review rules, intended users, and workflow details will be defined
as the project develops.

## Data

The project currently explores example data from `pharmaverseraw`. Datasets
should remain in their original domains and be linked where needed using
appropriate identifiers. The exact input format, supported domains, and
validation rules are still to be determined.

Do not use identifiable or otherwise sensitive patient data in this project.
Keep data files out of version control unless they are synthetic or explicitly
approved for sharing.

## Project status

This repository is an early scaffold. The application structure, data
specification, review workflow, and checks are not yet finalized.

## Getting started

Setup and run instructions will be added once the application and dependency
workflow are established. R dependencies are managed with `renv`.
