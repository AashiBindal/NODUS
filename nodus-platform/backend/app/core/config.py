import os

class Settings:
    PROJECT_NAME: str = "NODUS Platform"
    DB_SERVER: str = os.getenv("DB_SERVER", "localhost")
    DB_NAME: str = os.getenv("DB_NAME", "NODUS_DB")
    DB_USER: str = os.getenv("DB_USER", "sa")
    DB_PASSWORD: str = os.getenv("DB_PASSWORD", "YourStrongPassword123")
    JWT_SECRET: str = os.getenv("JWT_SECRET", "supersecretkey")

settings = Settings()
