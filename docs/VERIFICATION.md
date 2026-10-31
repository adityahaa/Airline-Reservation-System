# Verification record

Review date: 1 November 2026 (Asia/Kolkata).

- Inspected all Java sources and matched the added local MySQL schema to the SQL statements.
- Corrected User .java to User.java without rewriting the class; moved database/admin credentials to environment variables and ignored generated class/build files.
- Blocked: no javac executable, running MySQL database, or Connector/J JAR was available in this environment. Compilation, SQL migration, Swing interaction, and the functional workflow in TECHNICAL_REPORT.md were not executed. No passing Java test or demo is claimed.

Use the root README with a local JDK/MySQL installation and synthetic passenger information. Confirm the schema and JDBC integration before relying on any reservation behavior. No real passenger or national-identifier dataset is included.
