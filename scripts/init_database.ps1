$env:DATABASE_URL = "postgres://postgres:password@localhost:5435/newsletter"
sqlx.exe database create
sqlx.exe migrate run