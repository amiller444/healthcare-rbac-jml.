# Healthcare RBAC and Joiner/Mover/Leaver Audit

A fake-data SQL project that models role-based access control (RBAC) for a fictional dental group and audits it for common access problems. It is built on the access provisioning and HIPAA access-audit work I do in healthcare operations.

**All data is fictional. No real employee or patient information is used.**

## What it does

- Defines **roles**, **permissions**, and an **RBAC matrix** of what each role should be allowed to do
- Tracks **employees** (active and terminated) and the access each one **actually has**
- Runs **audit queries** that compare actual access against what is allowed

## Files

| File | Purpose |
|---|---|
| `schema.sql` | Creates all five tables and loads the sample data |
| `audit_queries.sql` | The audit queries, with comments explaining why each one matters |

## How to run it

1. Open any browser-based SQLite tool.
2. Paste in and run `schema.sql`.
3. Paste in and run the queries from `audit_queries.sql`.

## Audit findings on the sample data

| Audit | Finding | Risk |
|---|---|---|
| 1. Terminated employees with active access | 2 former employees (5 permissions total) still have access, including editing the ledger | Security and HIPAA risk, because access should end at termination |
| 2. Access beyond role | A front desk employee can edit the ledger, and a hygienist can run reports | Privilege creep, minimum-necessary violation, fraud risk |

## Joiner / Mover / Leaver process

**Joiner (new hire)**
1. The manager submits an access request naming the employee's role.
2. Access is granted from the role's permissions in the RBAC matrix, and nothing extra.
3. The grant is documented with a date and who approved it.

**Mover (role change)**
1. The manager submits the role change.
2. Access from the old role is removed.
3. Access for the new role is granted from the matrix.

**Leaver (termination)**
1. HR or the manager notifies IT on or before the last day.
2. All access is disabled the same day.
3. Audit 1 is run to verify that nothing was left active.

**Periodic review:** run both audits on a regular schedule (for example, quarterly) and document the results and fixes.

## Skills demonstrated

SQL (CREATE, INSERT, JOIN, LEFT JOIN, WHERE, ORDER BY), relational database design with primary and foreign keys, RBAC, HIPAA minimum-necessary access, access auditing, and process documentation.
