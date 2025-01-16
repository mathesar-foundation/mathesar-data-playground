# Ice Cream Employee Management

This schema represents an employee management system for an ice cream distributor, tracking employees, their timesheets, and schedules.

```mermaid
%% https://mermaid.js.org/syntax/entityRelationshipDiagram.html

erDiagram
    "Employees" {
        BIGINT id PK
        string name
        string role
        string email
    }

    "Timesheets" {
        BIGINT id PK
        BIGINT employee_id FK
        TIMESTAMP clock_in
        TIMESTAMP clock_out
        NUMERIC hours_worked
        DATE schedule_date
    }

    "Schedules" {
        BIGINT id PK
        BIGINT employee_id FK
        TIMESTAMP start_time
        TIMESTAMP end_time
        string business_needs
    }
%% Relationships
    "Timesheets" ||--|| "Employees" : "employee_id"
    "Schedules" ||--|| "Employees" : "employee_id"
