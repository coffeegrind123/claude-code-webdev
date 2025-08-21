# Web App Developer Container - Ready-to-Go Template
FROM node:18-alpine

# Install system dependencies
RUN apk add --no-cache \
    git \
    curl \
    bash \
    vim

# Set working directory
WORKDIR /workspace

# Install global npm packages for web development
RUN npm install -g \
    vite \
    @vitejs/plugin-react \
    create-vite \
    tailwindcss \
    autoprefixer \
    postcss

# Copy project template and prompt
COPY template/ /workspace/template/

# Create initialization script that copies template to mounted volume
RUN echo '#!/bin/bash' > /usr/local/bin/init-project && \
    echo 'set -e' >> /usr/local/bin/init-project && \
    echo '' >> /usr/local/bin/init-project && \
    echo '# Ensure project directory exists' >> /usr/local/bin/init-project && \
    echo 'mkdir -p /workspace/project' >> /usr/local/bin/init-project && \
    echo 'cd /workspace/project' >> /usr/local/bin/init-project && \
    echo '' >> /usr/local/bin/init-project && \
    echo '# Check if project needs initialization' >> /usr/local/bin/init-project && \
    echo 'if [ ! -f "package.json" ]; then' >> /usr/local/bin/init-project && \
    echo '  echo "🚀 Initializing React + Vite + Tailwind project from template..."' >> /usr/local/bin/init-project && \
    echo '  ' >> /usr/local/bin/init-project && \
    echo '  # Copy template files to mounted volume' >> /usr/local/bin/init-project && \
    echo '  cp -r /workspace/template/* /workspace/project/' >> /usr/local/bin/init-project && \
    echo '  ' >> /usr/local/bin/init-project && \
    echo '  # Install dependencies' >> /usr/local/bin/init-project && \
    echo '  echo "📦 Installing dependencies..."' >> /usr/local/bin/init-project && \
    echo '  npm install --silent' >> /usr/local/bin/init-project && \
    echo '  ' >> /usr/local/bin/init-project && \
    echo '  echo "✅ Project initialized successfully!"' >> /usr/local/bin/init-project && \
    echo 'else' >> /usr/local/bin/init-project && \
    echo '  echo "📁 Project already exists, ensuring dependencies are installed..."' >> /usr/local/bin/init-project && \
    echo '  if [ ! -d "node_modules" ]; then' >> /usr/local/bin/init-project && \
    echo '    npm install --silent' >> /usr/local/bin/init-project && \
    echo '  fi' >> /usr/local/bin/init-project && \
    echo 'fi' >> /usr/local/bin/init-project && \
    echo '' >> /usr/local/bin/init-project && \
    echo 'echo "🎯 Starting development server on port 5173..."' >> /usr/local/bin/init-project && \
    echo 'exec npm run dev' >> /usr/local/bin/init-project && \
    chmod +x /usr/local/bin/init-project

# Create a welcome script
RUN echo '#!/bin/bash' > /usr/local/bin/welcome && \
    echo 'echo "🚀 Welcome to the Web App Developer Container!"' >> /usr/local/bin/welcome && \
    echo 'echo "📋 Environment: React 18+ | Vite | Tailwind CSS"' >> /usr/local/bin/welcome && \
    echo 'echo "📁 Workspace: /workspace/project"' >> /usr/local/bin/welcome && \
    echo 'echo "📖 Master prompt available at: /workspace/web-app-developer-master-prompt.md"' >> /usr/local/bin/welcome && \
    echo 'echo ""' >> /usr/local/bin/welcome && \
    echo 'echo "✨ Project auto-initializes with React + Vite + Tailwind CSS template"' >> /usr/local/bin/welcome && \
    echo 'echo "🌐 Dev server starts automatically on http://host.docker.internal:5173"' >> /usr/local/bin/welcome && \
    echo 'echo ""' >> /usr/local/bin/welcome && \
    chmod +x /usr/local/bin/welcome

# Expose Vite dev server port
EXPOSE 5173

# Initialize project from template and start dev server
CMD ["/usr/local/bin/init-project"]
