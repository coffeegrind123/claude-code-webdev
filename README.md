# Claude Code WebDev

A web development environment and project template for building modern web applications.

## Structure

- `template/` - Base template for new web projects using Vite + React + Tailwind CSS
- `projects/` - Directory for individual project instances
- `start.sh` - Main startup script that launches Claude Code with the master prompt
- `start-dev.sh` - Development environment startup script (called by Claude Code)
- `docker-compose.yml` - Docker configuration for containerized development
- `Dockerfile` - Container image definition
- `web-app-developer-master-prompt.md` - Master prompt for Claude Code

## Quick Start

1. Run the main startup script to launch Claude Code:
   ```bash
   ./start.sh
   ```

   This will start Claude Code, which reads the master prompt and then executes `./start-dev.sh` to spin up the development environment.

2. Or manually run the development environment:
   ```bash
   ./start-dev.sh
   ```

3. Or use Docker:
   ```bash
   docker-compose up
   ```

## Template Features

- **Vite** - Fast build tool and dev server
- **React** - Modern UI library
- **Tailwind CSS** - Utility-first CSS framework
- **PostCSS** - CSS processing

## Usage

The template provides a solid foundation for building modern web applications with a focus on developer experience and fast iteration.