# Isolation Levels Phenomena

## Dirty Read

```mermaid
erDiagram
    Users ||--0{ Messages
    Users {
        INT userId PK
        TEXT name
    }

    Messages ||--0{ Attachments
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