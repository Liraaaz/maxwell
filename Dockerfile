FROM python:3.13.5-alpine3.22

# 2. Set the working directory in the container.
WORKDIR /app

# 3. Copy the dependencies file first to leverage Docker's layer caching.
COPY requirements.txt .

# 4. Install the dependencies.
# --no-cache-dir reduces image size.
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy the rest of the application's code into the container.
COPY . .

# 6. Expose the port the app runs on.
EXPOSE 8000

# 7. Define the command to run the app.
# Use --host 0.0.0.0 to make the server accessible from outside the container.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

