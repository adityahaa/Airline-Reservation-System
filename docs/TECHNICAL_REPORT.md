# Airline Reservation System technical report

## Problem and architecture

This desktop prototype demonstrates flight administration and passenger reservation operations. Swing dialogs call JDBC prepared statements against MySQL. MainWindow routes to Admin and User; Flight transports flight values; DatabaseConnection and DatabaseHandler provide connection/query access. ResultSet metadata drives table views.

## Implementation and reproduction improvements

The public User class originally lived in User .java, which violates Java's public-class filename rule. The filename is corrected to User.java. sql/schema.sql supplies users, flights, and bookings tables inferred from actual INSERT/SELECT/UPDATE statements, with foreign keys and no passenger seed records. Connection and administrator settings are read from environment variables rather than embedded credentials. See the root README for compile/run commands and required Connector/J classpath.

## Functional evaluation procedure

In a disposable local database, create the schema, configure credentials, compile, and launch. Add a synthetic flight in Admin; register a synthetic passenger; search by route/date; book a known flight ID; inspect the bookings table; check in by PNR; cancel and verify removal. Test an unknown PNR and empty inputs. The flight-selection dialog currently omits IDs although booking expects an ID, so inspect IDs in the administrator flight table. Do not interpret source review as a completed UI/database test.

## Results and limitations

No performance benchmark or executed integration result is available. A JDK, MySQL service, Connector/J, and graphical desktop are required for full verification. The schema has been matched to code but not migrated against a running MySQL instance in this review. See [verification record](VERIFICATION.md) for checks actually executed.

Passenger passwords remain plaintext. User-entered national identifiers and PNRs do not provide authorization. Seat 1A is fixed, capacity/concurrent allocation is absent, PNRs use timestamps, and numeric/date validation is incomplete. SQL exceptions can leave a null shared connection. Payment and background artwork are not supplied. These are explicit educational-prototype limits; authentication redesign and booking transactions are future work outside this documentation change.
