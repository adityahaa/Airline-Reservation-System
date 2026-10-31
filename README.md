# Airline Reservation System

A Java Swing and MySQL desktop prototype for flight administration and passenger reservation workflows. It demonstrates JDBC queries, table views, and dialog-driven interaction rather than a production airline booking service.

## Implemented features

- Administrator dialogs for adding flights and viewing flights, users, and bookings.
- Passenger registration/login and search by source, destination, and departure date.
- Booking creation with a timestamp-based PNR, cancellation, check-in, and booking lookup.

Payment processing is not implemented even though the original UI guidelines mention payment. Seat allocation is a fixed `1A` placeholder. Bookings and cancellation are identified through entered identifiers; this is not a secure authorization model.

## Architecture

`MainWindow.java` launches Swing navigation. `Admin.java` and `User.java` implement the workflows. `Flight.java` is the flight value object. `DatabaseConnection.java` configures JDBC and `DatabaseHandler.java` runs queries. The supplied [schema](sql/schema.sql) matches the columns used by this code; it contains no passenger records.

## Setup

Install a JDK, MySQL, and a compatible MySQL Connector/J JAR. Create the database using `sql/schema.sql` in a local MySQL client. Keep synthetic credentials/data only. In PowerShell, from this repository:

```powershell
$env:AIRLINE_DB_URL = 'jdbc:mysql://localhost:3306/airline_reservation_system'
$env:AIRLINE_DB_USER = 'YOUR_LOCAL_DATABASE_USER'
$env:AIRLINE_DB_PASSWORD = 'YOUR_LOCAL_DATABASE_PASSWORD'
$env:AIRLINE_ADMIN_USER = 'YOUR_LOCAL_ADMIN_USER'
$env:AIRLINE_ADMIN_PASSWORD = 'YOUR_LOCAL_ADMIN_PASSWORD'
New-Item -ItemType Directory -Force build
javac -d build *.java
java -cp "build;C:\path\to\mysql-connector-j.jar" MainWindow
```

On macOS/Linux replace the classpath `;` separator with `:`. The referenced background image `res/wp2025512.jpg` is absent; Swing can still render the controls without it. The Java source filename has been corrected to match public class `User`.

## Verification and limits

See the [technical report](docs/TECHNICAL_REPORT.md) for checks and a functional test procedure. Compilation and database/UI execution require tools not supplied by the repository. No successful end-to-end run is claimed in this review. Plaintext passenger passwords, permissive identifier-based actions, incomplete input validation, a shared connection, and no seat-capacity transactions limit this to local educational use. Do not enter real national identifiers or passenger data.

## Attribution

Maintained in Aditya Hambire's repository. Preserve existing Git history and contributor attribution; repository ownership alone is not a claim of sole authorship. No external dataset, model benchmark, or paper reproduction applies.

Current checks and unresolved prerequisites: [verification record](docs/VERIFICATION.md).
