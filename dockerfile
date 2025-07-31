FROM python:3.11-slim

# Install system dependencies for python-ldap
RUN apt-get update && \
    apt-get install -y gcc libsasl2-dev python3-dev libldap2-dev libssl-dev && \
    apt-get clean

# Set working directory
WORKDIR /app

# Copy code
COPY . .

# Install Python dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

# Expose port
EXPOSE 8069

# Start Odoo
CMD ["./odoo-bin", "-c", "odoo.conf"]
