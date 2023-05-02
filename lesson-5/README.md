# Isolation Levels Phenomena

## Dirty Read

```mermaid
erDiagram
    Users ||--o{ Messages : have
    Users {
        INT userId PK
        TEXT name
    }

    Messages ||--o{ Attachments : contains
    Messages {
        INT messageId PK
        INT userId
        TEXT subject
        TEXT body
    }

    Attachments {
        INT attachmentId PK
        INT messageId
        BLOB data
    }
```
