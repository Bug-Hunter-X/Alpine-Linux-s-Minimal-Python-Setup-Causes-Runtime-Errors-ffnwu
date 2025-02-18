# Dockerfile Bug: Alpine's Minimal Python Setup
This repository demonstrates a common error when using the `alpine` base image in Dockerfiles for Python applications.  Alpine's minimal nature often leads to runtime errors if dependencies aren't explicitly managed.

## The Bug
The provided `DockerfileBug.dockerfile` uses `alpine:latest` and attempts to run a simple Python web server. However, due to Alpine's limited Python installation, essential libraries might be missing.  This results in runtime failures, even if `requirements.txt` appears correct.

## The Solution
The `DockerfileSolution.dockerfile` provides a fix. It explicitly uses a more complete Python environment (`python:3.9-slim-buster`), eliminating the dependency issues seen in the original Dockerfile.

## How to Reproduce
1. Clone this repository.
2. Build the buggy image using:
   ```bash
   docker build -t buggy-image -f DockerfileBug.dockerfile .
   ```
3. Try to run the buggy container and observe the errors.
4. Now build the corrected image:
   ```bash
   docker build -t fixed-image -f DockerfileSolution.dockerfile .
   ```
5. Run the fixed container and observe successful execution.

## Lessons Learned
- Choosing the right base image is crucial in Docker.  While `alpine` is small, it can lead to unforeseen compatibility issues if not handled carefully.
- Always explicitly declare and install all necessary dependencies, even seemingly standard ones, to avoid runtime surprises.  Consider using a more robust base image from the start.